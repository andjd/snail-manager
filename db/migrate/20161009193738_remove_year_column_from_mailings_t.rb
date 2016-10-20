class RemoveYearColumnFromMailingsT < ActiveRecord::Migration[5.0]
  def change
  	remove_column :mailings, :year, :integer
  end
end
