class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :position
      t.integer :company_id
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
