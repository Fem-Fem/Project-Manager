apple = Company.create(name: "Apple", password: "password", location: "New York", motto: "Think different.")
microsoft = Company.create(name: "Microsoft", password: "password", location: "New York", motto: "Be What's Next.")
google = Company.create(name: "Google", password: "password", location: "Chicago", motto: "Don't Be Evil.")

self_driving_car = Project.create(name: "Project Alpha", description: "Creating self driving cars")
mind_reading_technology = Project.create(name: "Project Beta", description: "Working on telepathy")
teaching_people_to_code = Project.create(name: "Project Zeta", description: "Spreading the joys of coding everywhere")

femi = Worker.create(name: "Femi", position: "Software Engineer I")
clara = Worker.create(name: "Clara", position: "Front End Engineer I")
jake = Worker.create(name: "Jake", position: "Backend Engineer I")

femi.company_id = apple.id
femi.project_id = self_driving_car.id

clara.company_id = microsoft.id
clara.project_id = mind_reading_technology.id

jake.company_id = google.id
jake.project_id = teaching_people_to_code.id
