require 'csv'
	namespace :compare do
  	desc "compare information data into database"
  	task seed_compare: :environment do

#drop the old table data before importing the new stuff
    	Compare.destroy_all
    	CSV.foreach("lib/assets/compare.csv", :headers =>true) do |row |
      	puts row.inspect #just so that we know the file's being read

#create new model instances with the data
      	Compare.create!(
      	owner_no: row[0].to_i,
      	owner_name: row[1],
	      description: row[2],
      	manufacturer_code: row[3],
      	price: row[4].to_d   
     )
    end
  end
end
