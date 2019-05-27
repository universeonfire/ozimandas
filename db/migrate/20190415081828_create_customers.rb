class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :firm_name
      t.string :adress
      t.string :phone

      t.timestamps
    end
  end
end
