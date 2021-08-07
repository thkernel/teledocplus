class ApplicationController < ActionController::Base
	before_action :store_user_location!, if: :storable_location?

	before_action :set_mailer_settings
	
	protect_from_forgery with: :exception
	include ApplicationHelper






	rescue_from CanCan::AccessDenied do |exception|  
		flash[:alert] = "Access denied!"  
		redirect_to dashboard_path
	end

	


	private
  	def set_mailer_settings
	
      smtp_config = SmtpConfig.take

			if smtp_config.present?
				ActionMailer::Base.smtp_settings.merge!({
					:host => smtp_config.smtp_host ,
					:address => smtp_config.smtp_address , 
					:port => smtp_config.smtp_port,
					:domain => smtp_config.smtp_domain,
					:authentication => smtp_config.smtp_authentification,
					:user_name => smtp_config.smtp_user_name,
					:password => smtp_config.smtp_user_password,
          :enable_starttls_auto => smtp_config.smtp_enable_starttls_auto,
          :ssl => smtp_config.smtp_ssl
				})
				
			end
				#ActionMailer::Base.default_options = {from: "slatejob.official@gmail.com"}
		puts "SMTP CONF: #{smtp_config.inspect}"
		puts "SMTP BASE: #{ActionMailer::Base.smtp_settings.inspect}"
  	end



	
	def storable_location?
		request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
	end
  
	def store_user_location!
	# :user is the scope we are authenticating
	store_location_for(:user, request.fullpath)
	end

end
