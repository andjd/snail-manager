class CreateInternationalAddresses < ActiveRecord::Migration
  def change
    create_table :international_addresses do |t|
      t.string :address
      t.string :country

      t.timestamps null: false
    end
  end
end
