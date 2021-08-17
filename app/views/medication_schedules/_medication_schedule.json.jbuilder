json.extract! medication_schedule, :id, :uid, :doctor_id, :patient_id, :morning_number, :noo_number, :evening_number, :status, :comments, :user_id, :created_at, :updated_at
json.url medication_schedule_url(medication_schedule, format: :json)
