class PagesController < ApplicationController
	before_action :authenticate_user!
	def home
		@customers = Customer.all 
	end
end
