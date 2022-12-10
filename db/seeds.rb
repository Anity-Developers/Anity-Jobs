# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
role = Role.find_or_create_by!(name: 'admin')
user = User.create(name: "Test", email: "test@gmail.com", password: "password", role_id: role.id)
# user = User.first || User.find_or_create_by!(email: "test@gmail.com", password: "password", role_id: role.id)
location = Location.find_or_create_by!(name: "Rwanda🇷🇼")
company = Company.find_or_create_by!(name: "Rwanda Development Board", location: location)
category = Category.find_or_create_by!(name: "Tourism")
50.times do |i|
  job = Job.new(
    title: "Job #{i}",
    location: location,
    author: user,
    application_url: "https://www.google.com",
    company: company,
    category: category
  )
  job.description = description = ActionText::RichText.new(record_type:Job,record_id:job.id,body:"Job description #{i}")
  job.save!
end

Job.update_all(status: 1)

