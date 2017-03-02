class Mailing < ActiveRecord::Base
	def self.inheritance_column 
		# overrides the default Single Table Inheritence behavior of Active Record
	end

	def year
		return self.date.year
	end

	def formal?
		return !!self.formal
	end

	has_many :sends
	has_many :recipients, through: :sends,  source: :person

	has_many :responses
	has_many :responders, through: :responses,  source: :person

end
