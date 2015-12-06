class CreateSendReceives < ActiveRecord::Migration
  def change
    create_table :send_receives do |t|
      t.integer :people_id
      t.boolean :sent
      t.boolean :received
      t.integer :mailing_id

      t.timestamps null: false
    end
  end
end
