# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
projects = ["Space Study", "Genomics", "Aerodynamics"]
descriptions = ["An involved review of the stars", "In depth cancer research", "Flight and movement studies"]

  3.times do |i|
    Project.create(
    user_id: i + 1,
    name: projects[i],
    description: descriptions[i]
    )
  end

4.times do |i|
  User.create(
  first_name: Darlene{i},
  last_name: Sparks{i},
  email: "dartastic{i}@outlook.com"
  )
end

  project_members = [
  {user_id: 1, project_id: 1 },
  {user_id: 2, project_id: 1 },
  {user_id: 3, project_id: 2 },
  {user_id: 4, project_id: 2 },
  {user_id: 2, project_id: 3 },
  {user_id: 3, project_id: 3 }
]

project_members.each do |project|
  ProjectMembers.create(project)
end
