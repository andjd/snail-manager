class RenameReceiveToResponse < ActiveRecord::Migration[5.0]
  def change
  	rename_table :receives, :responses
  end
end
