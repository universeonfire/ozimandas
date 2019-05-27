class AddUnitReferenceToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :unit, foreign_key: true
  end
end
