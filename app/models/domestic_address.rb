class DomesticAddress < ActiveRecord::Base
	has_one :address, as: :address
end
