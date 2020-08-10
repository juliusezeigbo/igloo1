class CreateCompares < ActiveRecord::Migration[5.2]
  def change
    create_table :compares do |t|
      t.integer :owner_no
      t.string :owner_name
      t.string :description
      t.string :manufacturer_code
      t.decimal :price

      t.timestamps
    end
  end
end
