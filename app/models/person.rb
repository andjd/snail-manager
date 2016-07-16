
class Person < ActiveRecord::Base

	def self.parse_and_add_csv file 
		require 'CSV' 
		CSV.read( file, headers: true).each do |p|
			q = Person.create!(name: p["informal_name"], formal: p["formal_name"])
			q.dom.create!(street1: p["street1"], street2: p["street2"], city: p["city"], state: p["state"], zip: p["zip"])
		end
	end

	has_many :people_addresses

	has_many :domestic_addresses, through: :people_addresses, source: :address, source_type: "DomesticAddress"

	has_many :international_addresses, through: :people_addresses, source: :address, source_type: "InternationalAddress"

	alias_method :dom, :domestic_addresses

	alias_method :intl, :international_addresses

	has_many :send_receives, class_name: "SendReceive"

	has_many :mailings, through: :send_receives, source: :mailing

	def addresses
		self.people_addresses.load.map(&:address)
	end

	def current_address
		self.addresses.sort_by(&:updated_at).last
	end
end
