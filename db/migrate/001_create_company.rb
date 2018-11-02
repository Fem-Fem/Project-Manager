class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :password
      t.string :motto
      t.timestamps null: false
    end
  end
end
