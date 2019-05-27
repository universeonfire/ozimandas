class CreateTransporters < ActiveRecord::Migration[5.2]
  def change
    create_table :transporters do |t|
      t.string :transporter_name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
