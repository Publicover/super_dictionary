class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :word
      t.text :definition

      t.timestamps
    end
  end
end
