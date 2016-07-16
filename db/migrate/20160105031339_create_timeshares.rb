class CreateTimeshares < ActiveRecord::Migration
  def change
    create_table :timeshares do |t|
      t.integer :address_id
      t.string :address_type
      t.date :valid_from
      t.date :valid_to

      t.timestamps null: false
    end
    add_index :timeshares, :address_id
    add_index :timeshares, :valid_from
    add_index :timeshares, :valid_to
  end
end
