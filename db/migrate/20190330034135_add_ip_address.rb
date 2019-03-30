class AddIpAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :ip, :string
  end
end
