json.extract! contact_form, :id, :uid, :full_name, :phone, :email, :object, :message, :read, :read_at, :status, :created_at, :updated_at
json.url contact_form_url(contact_form, format: :json)
