require 'watir'

class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
     @companies = Company.paginate(:page => params[:page], :per_page => 5).search(params[:search])
     #where(["Description LIKE ?","%#{params[:search]}%"])
     
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end
  
  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  
  def show
      # added some condition for where clause
      @companies = Company.paginate(:page => params[:page], :per_page => 5)
      #puts @company.inspect  # selected item
      
      query = @company.Description.dup  # get descrip. of selected row
      stopwords = ['MAKITA', 'ONLY', 'EACH', 'LITRE', "-", "CLEAN", "CUT", "PTC20", "BODY", "BASIC"]  # terms to remove e.g. brand names - JIGSAW BLADE B17   WOOD
      stopwords.each do |item|
        query.slice! item
      end
      # remove terms that begin with numbers
      new_query = ''
      query.gsub(/\s+/m, ' ').strip.split(" ").each do |item|
          first_word = item.initial
          last_word = item.final
          unless first_word.is_number? || last_word.is_number?
              new_query+= ' ' + item
          end
      end
      query = new_query.strip!
      @generated_query = query

      # screwfix
      args = ['--no-sandbox', '--disable-dev-shm-usage']
      browser = Watir::Browser.new :chrome, headless: true, options: {args: args}
      browser.goto("https://www.screwfix.com/")
      browser.input(id: "mainSearch-input").send_keys(query)  # enter search term e.g. "Water pump"
      browser.send_keys :enter  # hit enter

      @screwfix_results = []
      @current_price = @company.GPH_RRP
      @maxprice = @current_price
      @minprice = @current_price
      begin
        # get first result
        first = Hash.new
        first["title"] = browser.div(id: "product_box_1").a(id: "product_description_1").attribute_value('title')
        first["price"] = browser.div(id: "product_box_1").h4(id: "product_list_price_1").text_content
        first["price"] = first["price"].tr('£', '')
        first["price"] = first["price"].to_f
        first["image_url"] = browser.div(id: "product_box_1").img(id: "product_image").attribute_value('src')
        first["link"] = browser.div(id: "product_box_1").a(id: "product_description_1").attribute_value('href')
        if first["price"] > @maxprice
          @maxprice = first["price"]
        end
        if first["price"] < @minprice
          @minprice = first["price"]
        end
        # get second result
        second = Hash.new
        second["title"] = browser.div(id: "product_box_2").a(id: "product_description_2").attribute_value('title')
        second["price"] = browser.div(id: "product_box_2").h4(id: "product_list_price_2").text_content
        second["price"] = second["price"].tr('£', '')
        second["price"] = second["price"].to_f
        second["image_url"] = browser.div(id: "product_box_2").img(id: "product_image").attribute_value('src')
        second["link"] = browser.div(id: "product_box_2").a(id: "product_description_2").attribute_value('href')
        if second["price"] > @maxprice
          @maxprice = second["price"]
        end
        if second["price"] < @minprice
          @minprice = second["price"]
        end
        
        @screwfix_results.push(first)
        @screwfix_results.push(second)
        # puts @screwfix_results.inspect
        # puts browser.links
      rescue StandardError => e
        puts e.message
        puts e.backtrace.inspect
      end
      browser.close if browser  # close browser
  end
  
  
  def import
     res = Company.import(params[:file])
     if res
      redirect_to companies_path, notice: "File Uploaded Successfully"
     else
      redirect_to companies_path, notice: "File was not Uploaded"
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:GPHProductCode, :SupplierProductCode, :BarCode, :Description, :GPH_RRP)
    end
end

class Object
  def is_number?
    to_f.to_s == to_s || to_i.to_s == to_s
  end
end

class String
  def initial
    self[0,1]
  end
  def final
    self[-1]
  end
end
