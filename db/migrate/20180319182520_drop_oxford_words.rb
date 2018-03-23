class DropOxfordWords < ActiveRecord::Migration[5.0]
  def change
    drop_table :oxford_words
  end
end
