class InternationalAddress < ActiveRecord::Base
	has_one :address, as: :address

	def domestic?
		false
	end
	
	def international?
		true
	end

end
