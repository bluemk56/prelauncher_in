class AddSessionToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :session, :string
  end
end
