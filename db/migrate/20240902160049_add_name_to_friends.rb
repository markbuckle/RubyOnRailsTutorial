class AddNameToFriends < ActiveRecord::Migration[7.2]
  def change
    add_column :friends, :name, :string
  end
end
