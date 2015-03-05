# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Founder.new
admin.email = "superadmin@yopmail.com"
admin.password = "superadmin"
admin.password_confirmation = "superadmin"
admin.save

admin.first_name = Faker::Name.first_name
admin.last_name = Faker::Name.last_name
admin.facebook = Faker::Internet.url('facebook.com')
admin.twitter = Faker::Internet.url('twitter.com')
admin.linkedin = Faker::Internet.url('linkedin.com')
admin.angellist = Faker::Internet.url('angel.co')
admin.skype = Faker::Internet.user_name
admin.cell_phone = Faker::PhoneNumber.cell_phone
admin.website = Faker::Internet.url
admin.all_startups = "#{Faker::Company.name}, #{Faker::Company.name} & #{Faker::Company.name}"
admin.save

5.times do
  founder = Founder.new
  founder.email = "#{Faker::Internet.user_name}@yopmail.com"
  founder.password = "12345678"
  founder.password_confirmation = "12345678"
  founder.save

  founder.first_name = Faker::Name.first_name
  founder.last_name = Faker::Name.last_name
  founder.facebook = Faker::Internet.url('facebook.com')
  founder.twitter = Faker::Internet.url('twitter.com')
  founder.linkedin = Faker::Internet.url('linkedin.com')
  founder.angellist = Faker::Internet.url('angel.co')
  founder.skype = Faker::Internet.user_name
  founder.cell_phone = Faker::PhoneNumber.cell_phone
  founder.website = Faker::Internet.url
  founder.all_startups = "#{Faker::Company.name}, #{Faker::Company.name} & #{Faker::Company.name}"
  founder.save
end

3.times do
  investor = Investor.new
  investor.email = "#{Faker::Internet.user_name}@yopmail.com"
  investor.password = "12345678"
  investor.password_confirmation = "12345678"
  investor.save
end

10.times do
  profile = InvestorProfile.new
  profile.email = "#{Faker::Internet.user_name}@yopmail.com"
  profile.company_name = Faker::Company.name
  profile.physical_address = "#{Faker::Address.street_address}, #{Faker::Address.zip_code} #{Faker::Address.city}"
  profile.phone_number = Faker::PhoneNumber.phone_number
  profile.facebook = Faker::Internet.url('facebook.com')
  profile.twitter = Faker::Internet.url('twitter.com')
  profile.linkedin = Faker::Internet.url('linkedin.com')
  profile.angellist = Faker::Internet.url('angel.co')
  profile.skype = Faker::Internet.user_name
  profile.website = Faker::Internet.url
  profile.sectors_invested_in = Faker::Commerce.department
  profile.capital_under_managment = rand(101) * 100_000
  profile.geographical_focus = "#{Faker::Address.country}, #{Faker::Address.country} & #{Faker::Address.country}"
  profile.preferred_investment_stage = ["seed", "stage A", "stage B", "stage C", "any"].sample
  profile.nb_projects_invested_in = rand(200)
  profile.contact_person = Faker::Name.name
  profile.contact_email = "#{Faker::Internet.user_name}@yopmail.com"
  profile.contact_cell_phone = Faker::PhoneNumber.cell_phone
  profile.save

  Founder.all.each do |founder|
    evaluation = Evaluation.new
    evaluation.founder = founder
    evaluation.investor_profile = profile
    evaluation.title_review = Faker::Company.bs
    evaluation.review = Faker::Lorem.paragraph(20)
    evaluation.rating_reputation = (0..5).to_a.sample
    evaluation.rating_deal = (0..5).to_a.sample
    evaluation.rating_pitch = (0..5).to_a.sample
    evaluation.rating_competence = (0..5).to_a.sample
    evaluation.rating_commitment = (0..5).to_a.sample
    evaluation.amount_raised = 10_000 * rand(100)
    evaluation.would_work_again = [true, false].sample
    evaluation.save
  end
end

Investor.all.each_with_index do |this_investor, index|
  i = InvestorProfile.find(index+1)
  this_investor.investor_profile = i
  this_investor.save
end