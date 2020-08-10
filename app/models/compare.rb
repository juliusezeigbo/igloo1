class Compare < ApplicationRecord
     def self.search(search)
         if search
           where (["manufacturer_code LIKE ?","%#{search}%"])
         
         else
           all
         end
        
     end
end