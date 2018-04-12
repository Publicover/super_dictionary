class AddColumsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :johnson_registered, :boolean, :default => false
    add_column :users, :johnson_token, :string
  end
end
