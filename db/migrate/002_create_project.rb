class CreateProjects < ActiveRecord::Migration
  def change
    create_table :task do |t|
      t.string :name
      t.string :description
      # boolean for status?
      # t.datetime :start_date
      # t.datetime :end_date
      t.timestamps null: false
    end
  end
end

Companies are all working together for something

project has many workers

companies has many workers

projects have many companies, through workers
companies have many projects, through workers

#
# tasks has many
#
# a has many b
# c has many b
# a has many c through b
#
#
# Movie
#
# actors, movies, rolls
#
# Movies has many rolls
# Movies has many actors, through rolls
#
# Actor has many rolls
# Actor has many actor, through rolls
#
# rolls belongs to actor
# rolls belongs to movie
#
#
# cook has many recipes
#
#
# recipes has many ingredients
# cook has many ingredients through recipes
