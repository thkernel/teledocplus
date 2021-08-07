module ApplicationHelper
	include MetaTagsHelper
	def property_thumbnail(property)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
		if property.thumbnail.attached?
			#image_tag property.thumbnail

            image_tag property.thumbnail.variant(combine_options: {resize: "308x205^",   gravity: 'Center', crop: '308x205+0+0'})
        else
            image_tag 'thumbnails/post-missing.jpg'
        end
	end

	def post_thumbnail(post)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if post.thumbnail.attached?
            image_tag post.thumbnail.variant(combine_options: {resize: "308x205^",   gravity: 'Center', crop: '308x205+0+0'})
        else
            image_tag 'thumbnails/post-missing.jpg'
        end
	end

	def ad_thumbnail(ad)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if ad.thumbnail.attached?
            image_tag ad.thumbnail.variant(combine_options: {resize: "308x205^",   gravity: 'Center', crop: '308x205+0+0'})
        else
            image_tag 'thumbnails/ad-missing.jpg'
        end
	end

	def property_cover_thumbnail(property)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if property.thumbnail.attached?
            image_tag property.thumbnail.variant(combine_options: {resize: "700x400^",  gravity: 'Center', crop: '700x400+0+0'})
        else
            image_tag 'thumbnails/post-missing.jpg'
        end
	end

	def post_cover_thumbnail(post)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if post.thumbnail.attached?
            image_tag post.thumbnail.variant(combine_options: {resize: "700x400^",  gravity: 'Center', crop: '700x400+0+0'})
        else
            image_tag 'thumbnails/post-missing.jpg'
        end
	end

	def ad_cover_thumbnail(ad)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if ad.thumbnail.attached?
            image_tag ad.thumbnail.variant(resize: "700x400")
        else
            image_tag 'thumbnails/ad-missing.jpg'
        end
	end

	def property_user_avatar(user_id)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
		user = User.find(user_id )
        if user.profile.avatar.attached?
            image_tag user.profile.avatar.variant(resize: "70x70"),   class: "rounded", alt: "Avatar"
        else
            image_tag 'thumbnails/avatar-missing.png',   class: "rounded", alt: "Avatar"
        end
	end


	def smtp_config?
		config = SmtpConfig.take

		if config.present? && config.smtp_user_name.present? &&  config.smtp_user_password.present? && 
			config.smtp_address.present? && config.smtp_port
		
			true 
		else
			false
		end
	end


	def property_type(id)
		property_type = PropertyType.find(id)
	end

	def offer_type(id)
		offer_type = OfferType.find(id)
	end

	def service(id)
		Service.find(id)
	end

	def user(id)
		User.find(id)
	end


	def user_notifications
		current_user.recipient_notifications.order(created_at: 'DESC').take(5)
	end

	
	def user_full_name(user_id)
		user = User.find(user_id)

		if user.present?
			if user.profile.profile_type.present? && user.profile.profile_type === "Agence"
				user.profile.company_name
			else
				"#{user.profile.last_name} #{user.profile.first_name}"
			end
		end

	end

	def is_account_locked?(user)
		if user.status == 'enable'
			false
		else
			true
		end
	end

	 
	 def current?(key, path)
		"#{key}" if current_page? path
		# We use string interpolation "#{key}" here to access the CSS classes we are going to create.
	 end

end
