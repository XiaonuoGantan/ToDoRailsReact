class CreateToDoItems < ActiveRecord::Migration
  def change
    create_table :to_do_items do |t|
      t.string :entry
      t.date :due_at

      t.timestamps null: false
    end
  end
end
