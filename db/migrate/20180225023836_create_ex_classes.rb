class CreateExClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :ex_classes do |t|
      t.string :word

      t.timestamps
    end
  end
end
