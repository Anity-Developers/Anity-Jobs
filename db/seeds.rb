# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Job.destroy_all
Company.destroy_all
Location.destroy_all
Category.destroy_all
User.destroy_all
Customer.destroy_all
Role.destroy_all
Package.destroy_all

subscription = [
  {
    package_type: "basic"
  },
  {
    package_type: "premium"
  },
  {
    package_type: "ultimate"
  }
]
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
role = Role.find_or_create_by!(name: "admin")
user = User.create(name: "Test", email: "test@gmail.com", password: "123456", role_id: role.id)
# user = User.first || User.find_or_create_by!(email: "test@gmail.com", password: "password", role_id: role.id)
location = Location.find_or_create_by!(name: "Rwanda🇷🇼")
Package.create!(subscription)
company = Company.find_or_create_by!(name: "Rwanda Development Board", location: location, package_id: Package.first.id)
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
  job.description = ActionText::RichText.new(record_type: Job, record_id: job.id, body: "Job description #{i}")
  job.save!
end

Job.update_all(status: 1)

puts "Seeding done!"
