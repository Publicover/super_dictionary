class RemoveDefinitionFromFullCall < ActiveRecord::Migration[5.0]
  def change
    remove_column :full_calls, :definition, :text
  end
end
