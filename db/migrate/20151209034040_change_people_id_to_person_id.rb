class ChangePeopleIdToPersonId < ActiveRecord::Migration
  def change
  	rename_column :people_addresses, :people_id, :person_id
  end
end
