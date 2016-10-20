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

	has_many :send_receives, class_name: "SendReceive"


	has_many :recipiants, through: :send_receives, source: :person

	def recipiants
		send_receives.includes(:person).where(sent: 1).map(&:person)
	end

	def responders
		send_receives.includes(:person).where(received: 1).map(&:person)
	end

end
