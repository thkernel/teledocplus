json.extract! appointment, :id, :patient_id, :prestataire, :appointment_date, :appointment_time, :status, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
