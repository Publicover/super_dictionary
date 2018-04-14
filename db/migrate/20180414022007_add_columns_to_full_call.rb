class AddColumnsToFullCall < ActiveRecord::Migration[5.0]
  def change
    add_column :full_calls, :oxford_def, :text
    add_column :full_calls, :webster_def, :text
    add_column :full_calls, :johnson_def, :text
    add_column :full_calls, :urban_def, :text
  end
end
