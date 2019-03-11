class AddFriendToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :friend, :integer
  end
end
