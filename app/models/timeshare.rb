class Timeshare < ActiveRecord::Base
	has_one :address, as: :address

	belongs_to :address, polymorphic: true

end
