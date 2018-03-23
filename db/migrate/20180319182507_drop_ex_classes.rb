class DropExClasses < ActiveRecord::Migration[5.0]
  def change
    drop_table :ex_classes
  end
end
