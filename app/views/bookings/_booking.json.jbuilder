json.extract! booking, :id, :booking_no, :booking_date, :booking_note, :navigation, :shipment_date, :ship_departure_date, :average_arrival_day, :document_delivery_time, :invoice_date, :payment_date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
