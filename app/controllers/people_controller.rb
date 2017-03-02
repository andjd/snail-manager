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
		unless @person.active
			@person.active = true
		end
		@person.save!
		current_address = @person.current_address
		new_address = @person.new_address(address_params[:new_address])
		is_id = Proc.new {|k,v| k == "id"}
		unless current_address.attributes.delete_if(&is_id) ==  new_address.attributes.delete_if(&is_id) 
			@person.addresses << new_address
			@person.save!
			new_address.save! 
		end
		redirect_to action: :index, anchor: "person_#{params[:id]}"
	end

	def create
		@person = Person.new(people_params)
		new_address = @person.new_address(address_params[:new_address])
		@person.addresses << new_address
		@person.save!
		new_address.save!
		redirect_to action: :index, anchor: "person_#{@person.id}"
	end

	def destroy
		@person = Person.find params[:id]
		@person.active = false
		@person.save!
		redirect_to action: :index
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
			:international, dom: [:id, :street1, :street2, :city, :state, :zip], intl: [:id, :lines, :country]
		])	
	end
end 