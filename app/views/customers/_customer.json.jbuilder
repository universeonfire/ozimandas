json.extract! customer, :id, :firm_name, :adress, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
