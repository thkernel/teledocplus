module UsersHelper
    def resource_name
	    :user
	end

	def resource
	    @resource ||= User.new
    end
	

    def thumb_avatar(width)
		profile = current_user.userable
		
        if profile && profile.avatar.attached?
            image_tag profile.avatar,  class: "wd-#{width} rounded-circle", alt: "Avatar"
        else
            image_tag 'thumbnails/avatar-missing.png',  class: "wd-#{width} rounded-circle", alt: "Avatar"
        end
    end

    def user_thumb_avatar(user, alt, width)
		profile = user.userable
		
        if profile && profile.avatar.attached?
            image_tag profile.avatar,  class: "wd-#{width} rounded-circle", alt: "Avatar"
        else
            image_tag 'thumbnails/avatar-missing.png',  class: "wd-#{width} rounded-circle", alt: "Avatar"
        end
    end

	

    def devise_title(controller)
		if controller == "sessions"
			t(:login)
		elsif controller == "registrations"
			t(:register)

		elsif controller == "admin_setup"
			t(:admin_setup)

		

		end
	end

	

end