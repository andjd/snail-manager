class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :formal

      t.timestamps null: false
    end
    add_index :people, :name
    add_index :people, :formal
  end
end
