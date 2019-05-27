class AddPathToNavigation < ActiveRecord::Migration[5.2]
  def change
    add_column :navigations, :path, :string
  end
end
