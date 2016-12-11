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

	def mailing_params
		params.require(:mailing).permit(:id, :type, :date, :formal, recipient_ids: [])
	end
end#class
