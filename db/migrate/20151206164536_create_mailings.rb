class CreateMailings < ActiveRecord::Migration
  def change
    create_table :mailings do |t|
      t.string :type
      t.integer :year

      t.timestamps null: false
    end
  end
end
