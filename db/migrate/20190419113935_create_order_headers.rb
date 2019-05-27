class CreateOrderHeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :order_headers do |t|
      t.date :order_date
      t.date :deadline
      t.string :invoice_number
      t.date :shipment_date

      t.timestamps
    end
  end
end
