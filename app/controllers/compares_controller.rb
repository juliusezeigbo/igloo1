class ComparesController < ApplicationController
  before_action :set_compare, only: [:show, :edit, :update, :destroy]

  # GET /compares
  # GET /compares.json
  def index
    @compares = Compare.paginate(:page => params[:page], :per_page => 8).search(params[:search])
     #where(["manufacturer_code LIKE ?","%#{params[:search]}%"])
    
  end

  # GET /compares/1
  # GET /compares/1.json
  def show
  end

  # GET /compares/new
  def new
    @compare = Compare.new
  end

  # GET /compares/1/edit
  def edit
  end

  # POST /compares
  # POST /compares.json
  def create
    @compare = Compare.new(compare_params)

    respond_to do |format|
      if @compare.save
        format.html { redirect_to @compare, notice: 'Compare was successfully created.' }
        format.json { render :show, status: :created, location: @compare }
      else
        format.html { render :new }
        format.json { render json: @compare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compares/1
  # PATCH/PUT /compares/1.json
  def update
    respond_to do |format|
      if @compare.update(compare_params)
        format.html { redirect_to @compare, notice: 'Compare was successfully updated.' }
        format.json { render :show, status: :ok, location: @compare }
      else
        format.html { render :edit }
        format.json { render json: @compare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compares/1
  # DELETE /compares/1.json
  def destroy
    @compare.destroy
    respond_to do |format|
      format.html { redirect_to compares_url, notice: 'Compare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def show
       # added some condition for where clause
       @compares = Compare.paginate(:page => params[:page], :per_page => 8)
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compare
      @compare = Compare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compare_params
      params.require(:compare).permit(:owner_no, :owner_name, :description, :manufacturer_code, :price)
    end
end
