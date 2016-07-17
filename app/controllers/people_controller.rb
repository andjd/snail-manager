class PeopleController < ApplicationController
	def index
		@people = Person.all
		render :index
	end

	def new
		render "New Mailing"
	end
end 