class AddWordToDashboard < ActiveRecord::Migration[5.0]
  def change
    add_column :dashboards, :word, :string
  end
end
