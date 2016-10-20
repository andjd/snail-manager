class AddFormalToMailings < ActiveRecord::Migration[5.0]
  def change
    add_column :mailings, :formal, :boolean
  end
end
