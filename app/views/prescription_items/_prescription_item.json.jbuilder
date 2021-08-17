json.extract! prescription_item, :id, :uid, :prescription_id, :medicament, :posologie, :comment, :status, :user_id, :created_at, :updated_at
json.url prescription_item_url(prescription_item, format: :json)
