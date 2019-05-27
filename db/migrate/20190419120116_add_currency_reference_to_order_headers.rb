class AddCurrencyReferenceToOrderHeaders < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_headers, :currency, foreign_key: true
  end
end
