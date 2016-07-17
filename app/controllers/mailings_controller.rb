class MailingsController < ApplicationController

	def index
		@mailings = Mailing.all.order(:date)
		render :index
	end

	def create
		@mailing = Mailing.new
		render :create
	end
end#class