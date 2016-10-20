class ChangeColumnAddressInInternationalAddressToLines < ActiveRecord::Migration[5.0]
  def change
  	rename_column :international_addresses, :address, :lines 
  end
end
