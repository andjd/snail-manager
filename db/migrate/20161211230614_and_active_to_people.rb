class AddActiveToPeople < ActiveRecord::Migration[5.0]
  def change
  	add_column :people, :active, :boolean, default: true
  end 
end
