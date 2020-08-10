class Company < ApplicationRecord
    
    #mount_uploader :csv_uploader, CsvUploader
  
    
   def self.import(file)
    if file.nil?
      puts "No file selected"
      return false
    else
      CSV.foreach(file.path, :headers =>true) do |row |
        puts row.inspect #just so that we know the file's being read
          #create new model instances with the data
        Company.create!(
          GPHProductCode: row[0],
          SupplierProductCode: row[1],
          BarCode: row[2].to_i,
          Description: row[3],
          GPH_RRP: row[4].to_d
        )
        return true
      end
    end
    
   end


    def self.search(search)
         if search
           where (["Description LIKE ?","%#{search}%"])
         
         else
           all
         end
        
    end



end






      	

      