module InquiryFormsHelper
    def property(id)
        Property.find(id)
    end
end
