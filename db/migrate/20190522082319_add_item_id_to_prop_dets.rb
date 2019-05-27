class AddItemIdToPropDets < ActiveRecord::Migration[5.2]
  def change
    add_column :prop_dets, :item_id, :numeric
  end
end
