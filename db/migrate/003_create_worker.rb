class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :position
      t.integer :user_id
      t.integer :task_id
      t.timestamps null: false
    end
  end
end
