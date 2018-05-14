class RemoveSjRegisteredFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :sj_registered, :boolean
  end
end
