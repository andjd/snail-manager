class SeparateSendReceives < ActiveRecord::Migration[5.0]
  def change

  	create_table "sends", force: :cascade do |t|
	    t.integer  "person_id"
	    t.integer  "mailing_id"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "receives", force: :cascade do |t|
	    t.integer  "person_id"
	    t.integer  "mailing_id"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	SendReceive.where(sent: true).find_each do |sr|
  		Send.create!(person_id: sr.person_id, mailing_id: sr.mailing_id)
  	end

  	SendReceive.where(received: true).find_each do |sr|
  		Receive.create!(person_id: sr.person_id, mailing_id: sr.mailing_id)
  	end

  	drop_table :send_receives

  end
end
