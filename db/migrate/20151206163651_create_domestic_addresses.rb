class CreateDomesticAddresses < ActiveRecord::Migration
  def change
    create_table :domestic_addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
