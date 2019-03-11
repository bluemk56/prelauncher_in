class AddUniqueToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :unique, :string
  end
end
