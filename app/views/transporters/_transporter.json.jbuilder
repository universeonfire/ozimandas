json.extract! transporter, :id, :transporter_name, :address, :phone, :created_at, :updated_at
json.url transporter_url(transporter, format: :json)
