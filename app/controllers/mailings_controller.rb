class MailingsController < ApplicationController

	def index
		@mailings = Mailing.all.order :date
		render :index
	end

	def show
		@mailing = Mailing.find params[:id]
		render :show
	end

	def print
		@mailing = Mailing.find params[:id]
		render :print
	end

	def create
		@mailing = Mailing.new mailing_params
		if @mailing.save
			redirect_to @mailing
		end
	end

	def new
		@mailing = Mailing.new
		@people = Person.all
		render :new
	end

	def log_recd
		@mailing = Mailing.find params[:mailing_id]
		@mailing.responders << Person.find(params[:person_id])
		@mailing.save!
		redirect_back fallback_location: {action: :index}, anchor: "person_#{params[:person_id]}" 
	end

	def clear_log_recd
		@mailing = Mailing.find params[:mailing_id]
		@mailing.responders.delete Person.find(params[:person_id])
		@mailing.save!
		redirect_back fallback_location: {action: :index}, anchor: "person_#{params[:person_id]}" 
	end

	def mailing_params
		params.require(:mailing).permit(:id, :type, :date, :formal, recipient_ids: [])
	end

end#class
