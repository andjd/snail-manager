class CreatePeopleAddresses < ActiveRecord::Migration
  def change
    create_table :people_addresses do |t|
      t.integer :people_id
      t.integer :address_id
      t.string :address_type

      t.timestamps null: false
    end
  end
end
