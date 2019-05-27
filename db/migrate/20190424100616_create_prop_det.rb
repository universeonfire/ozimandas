class CreatePropDet < ActiveRecord::Migration[5.2]
  def change
    create_table :prop_dets do |t|
      t.numeric :quantity
      t.numeric :unit_price
      t.numeric :total_price
    end
  end
end
