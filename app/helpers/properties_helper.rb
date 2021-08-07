module PropertiesHelper

	def property_type(id)
		property_type = PropertyType.find(id)
	end

	def offer_type(id)
		offer_type = OfferType.find(id)
	end

	def kramdown(text)
	   Kramdown::Document.new(text).to_html
	end
	def mark(text)
		markdown = Redcarpet::Markdown.new()
		markdown.render(text)
	end

	def featured?(property_id)
		property = Property.find(property_id)
		if property.featured == true
			true
		else
			false
		end
	end
end
