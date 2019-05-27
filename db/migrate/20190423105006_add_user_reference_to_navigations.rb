class AddUserReferenceToNavigations < ActiveRecord::Migration[5.2]
  def change
    add_reference :navigations, :user, foreign_key: true
  end
end
