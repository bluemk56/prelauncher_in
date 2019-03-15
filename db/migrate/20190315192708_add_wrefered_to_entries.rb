class AddWreferedToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :wrefered, :string
  end
end
