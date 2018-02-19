json.extract! reminder, :id, :jobseeker_id, :description, :status, :type, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)