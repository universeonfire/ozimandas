class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	def respond_modal_with(*args, &blk)
		options = args.extract_options!
		options[:responder] = ModalResponder
		respond_with *args, options, &blk
	end
	protected

	def configure_permitted_parameters
		added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
	
end
