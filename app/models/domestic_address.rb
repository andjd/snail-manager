class DomesticAddress < ActiveRecord::Base
	has_one :address, as: :address

	def as_lines
		[street1, street2, [city + ",", state, zip].join(" ")].delete_if(&:blank?)
	end

	def domestic?
		true
	end

	def international?
		false
	end
end
