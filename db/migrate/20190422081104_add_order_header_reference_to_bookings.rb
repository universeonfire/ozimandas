class AddOrderHeaderReferenceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :order_header, foreign_key: true
  end
end
