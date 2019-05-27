json.extract! order_header, :id, :order_date, :deadline, :invoice_number, :shipment_date, :created_at, :updated_at
json.url order_header_url(order_header, format: :json)
