class AddDateColumnToMailingsTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :mailings, :date, :date
  	add_index :mailings, :date
  end
end
