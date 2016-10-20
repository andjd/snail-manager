class InternationalAddress < ActiveRecord::Base
	has_one :address, as: :address

	def as_lines
		lines.split("\n").delete_if(&:blank?)
	end

	def domestic?
		false
	end
	
	def international?
		true
	end

end
