class AddColumnsToFullCall < ActiveRecord::Migration[5.0]
  def change
    add_column :full_calls, :oxford_def, :text
    add_column :full_calls, :webster_def, :text
    add_column :full_calls, :johnson_def, :text
    add_column :full_calls, :urban_def, :text
    add_column :full_calls, :oxford_vote, :integer, :default => 0
    add_column :full_calls, :webster_vote, :integer, :default => 0
    add_column :full_calls, :johnson_vote, :integer, :default => 0
    add_column :full_calls, :urban_vote, :integer, :default => 0
  end
end
