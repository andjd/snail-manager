class PeopleController < ApplicationController
	def index
		@people = Person.all
		render :index
	end

	def edit
		@person = Person.find params[:id]
		render :edit
	end

	def update
		@person = Person.find params[:id]
		@person.update(people_params)
		current_address = @person.current_address
		new_address = @person.new_address(address_params[:new_address])
		@person.addresses << new_address
		new_address.save! 
		@person.update
		render :edit
	end

	def create
		@person = Person.new(people_params)
		new_address = @person.new_address(address_params[:new_address])
		@person.addresses << new_address
		@person.save!
		new_address.save!
		render :edit
	end

	def new
		@person = Person.new
		render :new
	end

	def people_params
		params.require(:person).permit(:name, :formal)
	end
	def address_params
		params.require(:person).permit(new_address: [
			:international, dom: [:id, :street1, :street2, :city, :state, :zip], intl: [:id, :lines]
		])
			
	end
end 