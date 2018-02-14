class CreateOxfordWords < ActiveRecord::Migration[5.0]
  def change
    create_table :oxford_words do |t|
      t.string :word
      t.string :definition
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
