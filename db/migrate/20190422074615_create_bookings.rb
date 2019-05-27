class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :booking_no
      t.date :booking_date
      t.text :booking_note
      t.string :navigation
      t.date :shipment_date
      t.date :ship_departure_date
      t.numeric :average_arrival_day
      t.numeric :document_delivery_time
      t.date :invoice_date
      t.date :payment_date

      t.timestamps
    end
  end
end
