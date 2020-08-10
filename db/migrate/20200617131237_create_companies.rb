class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :GPHProductCode
      t.string :SupplierProductCode
      t.integer :BarCode
      t.string :Description
      t.decimal :GPH_RRP

      t.timestamps
    end
  end
end
