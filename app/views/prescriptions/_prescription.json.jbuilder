json.extract! prescription, :id, :uid, :doctor_id, :patient_id, :status, :user_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
