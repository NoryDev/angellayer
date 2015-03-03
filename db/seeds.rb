# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Investor.all.each do |investor|
  investor.destroy
end

10.times do
  investor = Investor.new()
  investor.email = "#{Faker::Internet.user_name}@yopmail.com"
  investor.password = "12345678"
  investor.password_confirmation = "12345678"
  investor.save

  investor.company_name = Faker::Company.name
  investor.physical_address = "#{Faker::Address.street_address}, #{Faker::Address.zip_code} #{Faker::Address.city}"
  investor.phone_number = Faker::PhoneNumber.phone_number
  investor.facebook = Faker::Internet.url('facebook.com')
  investor.twitter = Faker::Internet.url('twitter.com')
  investor.linkedin = Faker::Internet.url('linkedin.com')
  investor.angellist = Faker::Internet.url('angel.co')
  investor.skype = Faker::Internet.url('skype.com')
  investor.website = Faker::Internet.url
  investor.sectors_invested_in = Faker::Commerce.department
  investor.capital_under_managment = rand(101) * 100_000
  investor.geographical_focus = "#{Faker::Address.country}, #{Faker::Address.country} & #{Faker::Address.country}"
  investor.preferred_investment_stage = ["seed", "stage A", "stage B", "stage C", "any"].sample
  investor.nb_projects_invested_in = rand(200)
  investor.contact_person = Faker::Name.name
  investor.contact_email = "#{Faker::Internet.user_name}@yopmail.com"
  investor.contact_cell_phone = Faker::PhoneNumber.cell_phone
  investor.save
end