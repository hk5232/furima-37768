class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :buy, null: false, foreign_key: true 
      t.string :postal_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.string :phone_number, null: false
      t.integer :source_id, null: false
      t.timestamps
    end
  end
end
