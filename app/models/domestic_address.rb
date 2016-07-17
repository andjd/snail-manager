class DomesticAddress < ActiveRecord::Base
	has_one :address, as: :address

	def domestic?
		true
	end

	def international?
		false
	end
end
