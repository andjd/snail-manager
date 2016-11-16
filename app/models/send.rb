class Send < ActiveRecord::Base
	belongs_to :person

	belongs_to :mailing

end