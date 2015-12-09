class InternationalAddress < ActiveRecord::Base
	has_one :address, as: :address
end
