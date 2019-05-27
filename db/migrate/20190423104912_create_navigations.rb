class CreateNavigations < ActiveRecord::Migration[5.2]
  def change
    create_table :navigations do |t|
      t.string :title
      t.boolean :is_visible
      t.boolean :can_create
      t.boolean :can_edit
      t.boolean :can_delete

      t.timestamps
    end
  end
end
