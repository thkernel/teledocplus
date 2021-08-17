json.extract! hta_monitoring, :id, :patient_id, :tas, :tad, :status, :comments, :user_id, :created_at, :updated_at
json.url hta_monitoring_url(hta_monitoring, format: :json)
