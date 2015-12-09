class PeopleAddress < ActiveRecord::Base
	belongs_to :address, polymorphic: true

	belongs_to :person
end
