apple = Company.create(name: "Apple", password: "password", location: "New York", motto: "Think different.")
microsoft = Company.create(name: "Microsoft", password: "password", location: "New York", motto: "Be What's Next.")
google = Company.create(name: "Google", password: "password", location: "Chicago", motto: "Don't Be Evil.")

self_driving_car = Project.create(name: "Project Alpha", description: "Creating self driving cars")

t.string :name
t.string :description
t.datetime :start_date
t.datetime :end_date

femi = Worker.create(name: "Femi", position: "Software Engineer I")
femi.company_id = apple.id


create_table :workers do |t|
  t.string :name
  t.string :position
  t.integer :company_id
  t.integer :project_id
