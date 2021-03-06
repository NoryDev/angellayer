# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Founder.new
admin.email = "c3po@yopmail.com"
admin.password = "superadmin"
admin.password_confirmation = "superadmin"
admin.save

admin.first_name = 'C3PO'
admin.last_name = 'Protocol Droid'
admin.facebook = Faker::Internet.url('facebook.com')
admin.twitter = Faker::Internet.url('twitter.com')
admin.linkedin = Faker::Internet.url('linkedin.com')
admin.angellist = Faker::Internet.url('angel.co')
admin.skype = Faker::Internet.user_name
admin.cell_phone = Faker::PhoneNumber.cell_phone
admin.website = 'www.c3pO-droid.com'
admin.all_startups = 'Droids for all, Oil for squeaks & The protocol school for droids'
admin.save

admin.admin = true
admin.save


founder1 = Founder.new
founder1.email = "Lukeskywalker@yopmail.com"
founder1.password = "12345678"
founder1.password_confirmation = "12345678"
founder1.save

founder1.first_name = 'Luke'
founder1.last_name = 'Sky-Walker'
founder1.facebook = Faker::Internet.url('facebook.com')
founder1.twitter = Faker::Internet.url('twitter.com')
founder1.linkedin = Faker::Internet.url('linkedin.com')
founder1.angellist = Faker::Internet.url('angel.co')
founder1.skype = Faker::Internet.user_name
founder1.cell_phone = Faker::PhoneNumber.cell_phone
founder1.website = 'www.luke-help-me.com'
founder1.all_startups = 'Robes for men, Toni & Guy Hairdresser, Pink Lightsabers limited'
founder1.save

founder2 = Founder.new
founder2.email = "princessleia@yopmail.com"
founder2.password = "12345678"
founder2.password_confirmation = "12345678"
founder2.save

founder2.first_name = 'Princess'
founder2.last_name = 'Leia'
founder2.facebook = Faker::Internet.url('facebook.com')
founder2.twitter = Faker::Internet.url('twitter.com')
founder2.linkedin = Faker::Internet.url('linkedin.com')
founder2.angellist = Faker::Internet.url('angel.co')
founder2.skype = Faker::Internet.user_name
founder2.cell_phone = Faker::PhoneNumber.cell_phone
founder2.website = 'www.theprincess.com'
founder2.all_startups = 'Ewok protection association, starfighters Inc & Millenium Falcon Interior Design'
founder2.save

founder3 = Founder.new
founder3.email = "Battledroid@yopmail.com"
founder3.password = "12345678"
founder3.password_confirmation = "12345678"
founder3.save

founder3.first_name = 'Battle'
founder3.last_name = 'Droid'
founder3.facebook = Faker::Internet.url('facebook.com')
founder3.twitter = Faker::Internet.url('twitter.com')
founder3.linkedin = Faker::Internet.url('linkedin.com')
founder3.angellist = Faker::Internet.url('angel.co')
founder3.skype = Faker::Internet.user_name
founder3.cell_phone = Faker::PhoneNumber.cell_phone
founder3.website = 'www.droids-kill-kill-kill.com'
founder3.all_startups = 'Imperial-shuttle cleaning inc, Star Cruiser wheels shiner, Ewok protection association'
founder3.save

founder4 = Founder.new
founder4.email = "StormTrooper@yopmail.com"
founder4.password = "12345678"
founder4.password_confirmation = "12345678"
founder4.save

founder4.first_name = 'Storm'
founder4.last_name = 'Trooper'
founder4.facebook = Faker::Internet.url('facebook.com')
founder4.twitter = Faker::Internet.url('twitter.com')
founder4.linkedin = Faker::Internet.url('linkedin.com')
founder4.angellist = Faker::Internet.url('angel.co')
founder4.skype = Faker::Internet.user_name
founder4.cell_phone = Faker::PhoneNumber.cell_phone
founder4.website = 'www.super-storm-trooper.com'
founder4.all_startups = 'White shine for armours, blaster-riffle supercharger inc & Droid Poppers'
founder4.save

founder5 = Founder.new
founder5.email = "captainneeda@yopmail.com"
founder5.password = "12345678"
founder5.password_confirmation = "12345678"
founder5.save

founder5.first_name = 'Captain'
founder5.last_name = 'Needa'
founder5.facebook = Faker::Internet.url('facebook.com')
founder5.twitter = Faker::Internet.url('twitter.com')
founder5.linkedin = Faker::Internet.url('linkedin.com')
founder5.angellist = Faker::Internet.url('angel.co')
founder5.skype = Faker::Internet.user_name
founder5.cell_phone = Faker::PhoneNumber.cell_phone
founder5.website = 'www.Captain-Need.com'
founder5.all_startups = 'Death-star hotels, droid droppers inc, Imperial-star destroyer & lasers unlimited'
founder5.save




investor4 = Investor.new
investor4.email = "darthvader@yopmail.com"
investor4.password = "12345678"
investor4.password_confirmation = "12345678"
investor4.save

profile4 = InvestorProfile.new
profile4.email = investor4.email
profile4.company_name = 'Darth Vader VC'
profile4.physical_address = 'The Death-star in a galaxy far far away'
profile4.phone_number = Faker::PhoneNumber.phone_number
profile4.facebook = Faker::Internet.url('facebook.com')
profile4.twitter = Faker::Internet.url('twitter.com')
profile4.linkedin = Faker::Internet.url('linkedin.com')
profile4.angellist = Faker::Internet.url('angel.co')
profile4.skype = Faker::Internet.user_name
profile4.website = 'www.darth_vader.com'
profile4.sectors_invested_in = 'The Dark side, weapons, warships and other extermination products'
profile4.capital_under_managment = rand(101) * 100_000
profile4.geographical_focus = 'Anywhere in the Galaxy, excepting Ewok land'
profile4.preferred_investment_stage = "Stage B & stage C only."
profile4.nb_projects_invested_in = rand(200)
profile4.contact_person = 'Darth Vader'
profile4.contact_email = investor4.email
profile4.contact_cell_phone = Faker::PhoneNumber.cell_phone
profile4.save

# i = profile4.find(index+1)
investor4.investor_profile = profile4
investor4.save

evaluation1 = Evaluation.new
evaluation1.founder = admin
evaluation1.investor_profile = profile4
evaluation1.title_review = 'This Firm is Dark, I want to get out...'
evaluation1.review = 'Help me... I first met Mr Vader in a shady bar of one
of his friends. Jabba the hut. I thought he was convincing and he certainly
seemed to have a lot of capital he wanted to invest wisely. When I told him
about my new "Oil for Droids" ® he told me the idea was excellent. Then he tried
to kill me, I managed to escape by falling through a trap door. Can not remember
much after that...'
evaluation1.rating_reputation = 1
evaluation1.rating_deal = 1
evaluation1.rating_pitch = 1
evaluation1.rating_competence = 1
evaluation1.rating_commitment = 1
evaluation1.amount_raised = 10_000 * rand(100)
evaluation1.would_work_again = false
evaluation1.save

evaluation1b = Evaluation.new
evaluation1b.founder = founder2
evaluation1b.investor_profile = profile4
evaluation1b.title_review = 'Very disappointed by Mr Vader'
evaluation1b.review = "Frightening at first, I then thought I had actually found
a father figure in Mr Vader. Then he suddenly turned to the dark side, or was
I too blind to see this at first. The business deal was terrible, he got into great
tantrums and started killing the staff. He also breathes extremely loud, very difficult
to concentrate when he's around."
evaluation1b.rating_reputation = 2
evaluation1b.rating_deal = 1
evaluation1b.rating_pitch = 2
evaluation1b.rating_competence = 1
evaluation1b.rating_commitment = 2
evaluation1b.amount_raised = 10_000 * rand(100)
evaluation1b.would_work_again = false
evaluation1b.save

evaluation1c = Evaluation.new
evaluation1c.founder = founder5
evaluation1c.investor_profile = profile4
evaluation1c.title_review = 'Mr Vader is a great boss, no really I mean it!'
evaluation1c.review = "Well there's nothing more to say I was really really really
delighted to work once again with him, yes I really mean it!! He invested in my
Death-star Hotels© and really understood the potential of this business...
Please get me out of here..."
evaluation1c.rating_reputation = 2
evaluation1c.rating_deal = 1
evaluation1c.rating_pitch = 2
evaluation1c.rating_competence = 1
evaluation1c.rating_commitment = 2
evaluation1c.amount_raised = 10_000 * rand(100)
evaluation1c.would_work_again = false
evaluation1c.save

evaluation1d = Evaluation.new
evaluation1d.founder = founder3
evaluation1d.investor_profile = profile4
evaluation1d.title_review = 'Mr Vader is about to reboot me'
evaluation1d.review = "I don't know what I did wrong but Mr Vader stole my business
Star Wheel cleaner®. It sounds familiar after my adventure with Mr Jabba, maybe
I'll just never learn, especially since I think Mr Vader is about to reboot me
and wipe out my memory."
evaluation1d.rating_reputation = 1
evaluation1d.rating_deal = 1
evaluation1d.rating_pitch = 1
evaluation1d.rating_competence = 2
evaluation1d.rating_commitment = 1
evaluation1d.amount_raised = 10_000 * rand(100)
evaluation1d.would_work_again = false
evaluation1d.save





investor2 = Investor.new
investor2.email = "yoda@yopmail.com"
investor2.password = "12345678"
investor2.password_confirmation = "12345678"
investor2.save

profile2 = InvestorProfile.new
profile2.email = investor2.email
profile2.company_name = 'Yoda Invest'
profile2.physical_address = "Misty Swamp"
profile2.phone_number = Faker::PhoneNumber.phone_number
profile2.facebook = Faker::Internet.url('facebook.com')
profile2.twitter = Faker::Internet.url('twitter.com')
profile2.linkedin = Faker::Internet.url('linkedin.com')
profile2.angellist = Faker::Internet.url('angel.co')
profile2.skype = Faker::Internet.user_name
profile2.website = 'www.yoda.com'
profile2.sectors_invested_in = 'The Force, Ewok clothing and Green Tree Meditation Schools'
profile2.capital_under_managment = rand(101) * 100_000
profile2.geographical_focus = 'In you and all places where there is the force'
profile2.preferred_investment_stage = "Young padawan stage"
profile2.nb_projects_invested_in = rand(200)
profile2.contact_person = 'Yoda'
profile2.contact_email = investor2.email
profile2.contact_cell_phone = Faker::PhoneNumber.cell_phone
profile2.save

# i = profile2.find(index+1)
investor2.investor_profile = profile2
investor2.save

evaluation2 = Evaluation.new
evaluation2.founder = founder2
evaluation2.investor_profile = profile2
evaluation2.title_review = 'It was delightful'
evaluation2.review = "Mr Yoda really helped me grow my company and my hair.
He helped me do my curly braces and find a great business model. Thanks to
him I found loads of business partners and even a new co-founder (who ended
up being my brother, gosh...). My Millenium Falcon Interior Design© is now working
great, thanks to Mr Yoda's experience we are growing as fast as star-fighter..."
evaluation2.rating_reputation = 4
evaluation2.rating_deal = 4
evaluation2.rating_pitch = 4
evaluation2.rating_competence = 4
evaluation2.rating_commitment = 4
evaluation2.amount_raised = 10_000 * rand(100)
evaluation2.would_work_again = true
evaluation2.save

evaluation2b = Evaluation.new
evaluation2b.founder = founder4
evaluation2b.investor_profile = profile2
evaluation2b.title_review = 'I loved working with Yoda'
evaluation2b.review = "Everybody thinks that StormTrooper's lack personality
and don't have enough charisma to build and keep a business. But Mr Yoda really
sensed the force within me and invested massively his time, his energy and his money
this was a great success and I do it again anyday..."
evaluation2b.rating_reputation = 3
evaluation2b.rating_deal = 5
evaluation2b.rating_pitch = 3
evaluation2b.rating_competence = 5
evaluation2b.rating_commitment = 3
evaluation2b.amount_raised = 10_000 * rand(100)
evaluation2b.would_work_again = true
evaluation2b.save

evaluation2c = Evaluation.new
evaluation2c.founder = admin
evaluation2c.investor_profile = profile2
evaluation2c.title_review = 'I really felt the force with Mr Yoda'
evaluation2c.review = "I came to Yoda with my oil for squeaks®.
I come from a background where there is little room for self-development and
Mr Yoda not only helped me better define and sell my product, but he was
also a great coach and helped me find the creativity and the force that lied
within me. I don't know how to thank him for everything he's done. The business
is going fine, we have really managed to find and develop a niche product."
evaluation2c.rating_reputation = 5
evaluation2c.rating_deal = 3
evaluation2c.rating_pitch = 5
evaluation2c.rating_competence = 4
evaluation2c.rating_commitment = 5
evaluation2c.amount_raised = 10_000 * rand(100)
evaluation2c.would_work_again = true
evaluation2c.save


investor3 = Investor.new
investor3.email = "Jabba@yopmail.com"
investor3.password = "12345678"
investor3.password_confirmation = "12345678"
investor3.save

profile3 = InvestorProfile.new
profile3.email = investor3.email
profile3.company_name = 'Jabba the Hutt'
profile3.physical_address = 'A dark bar on a shady planet'
profile3.phone_number = Faker::PhoneNumber.phone_number
profile3.facebook = Faker::Internet.url('facebook.com')
profile3.twitter = Faker::Internet.url('twitter.com')
profile3.linkedin = Faker::Internet.url('linkedin.com')
profile3.angellist = Faker::Internet.url('angel.co')
profile3.skype = Faker::Internet.user_name
profile3.website = 'www.jabbas-bar.com'
profile3.sectors_invested_in = 'Alcohol, gambling and games'
profile3.capital_under_managment = rand(101) * 100_000
profile3.geographical_focus = "I'll find you wherever you hide"
profile3.preferred_investment_stage = "No deal is too big or too small"
profile3.nb_projects_invested_in = rand(200)
profile3.contact_person = 'Jabba The Hutt'
profile3.contact_email = investor3.email
profile3.contact_cell_phone = Faker::PhoneNumber.cell_phone
profile3.save

# i = profile3.find(index+1)
investor3.investor_profile = profile3
investor3.save

evaluation3 = Evaluation.new
evaluation3.founder = founder3
evaluation3.investor_profile = profile3
evaluation3.title_review = "How did Jabba the Hutt do it?"
evaluation3.review = "Well, that was an experience. I don't really know what
I got out of it. I came to Mr Jaba with an interesting idea about an cleaning
 system for the Imperial-shuttle. Mr Jabba was interested in the idea and
 invested in my firm. A few months later he seems to have taken possession
 of the firm completely. I have no more stock and no more options. But the
 firm is going great and Mr Jabba has found an exit strategy. Where did I go wrong?"
evaluation3.rating_reputation = 1
evaluation3.rating_deal = 1
evaluation3.rating_pitch = 4
evaluation3.rating_competence = 5
evaluation3.rating_commitment = 4
evaluation3.amount_raised = 10_000 * rand(100)
evaluation3.would_work_again = false
evaluation3.save


evaluation3b = Evaluation.new
evaluation3b.founder = founder2
evaluation3b.investor_profile = profile3
evaluation3b.title_review = 'Jabba the Hutt kept me prisoner!'
evaluation3b.review = "I came to Jabba the Hutt with a great business proposal.
He took me prisoner and kept me chained for weeks before my brother came to free
me. I don't know what to say except flee Jabba, avoid landing on his planet."
evaluation3b.rating_reputation = 1
evaluation3b.rating_deal = 1
evaluation3b.rating_pitch = 1
evaluation3b.rating_competence = 1
evaluation3b.rating_commitment = 1
evaluation3b.amount_raised = 10_000 * rand(100)
evaluation3b.would_work_again = false
evaluation3b.save

evaluation3c = Evaluation.new
evaluation3c.founder = founder1
evaluation3c.investor_profile = profile3
evaluation3c.title_review = 'Jabba the What???'
evaluation3c.review = "Never again, I went there with my friend Han Solo.
I thought Jabba would be interested in my business, but instead I had
to free my captured sister and blast my way out of his shady bar"
evaluation3c.rating_reputation = 1
evaluation3c.rating_deal = 1
evaluation3c.rating_pitch = 1
evaluation3c.rating_competence = 3
evaluation3c.rating_commitment = 1
evaluation3c.amount_raised = 10_000 * rand(100)
evaluation3c.would_work_again = false
evaluation3c.save

evaluation3d = Evaluation.new
evaluation3d.founder = founder2
evaluation3d.investor_profile = profile3
evaluation3d.title_review = 'Free Me from Jabba the Hutt'
evaluation3d.review = "I am still prisoner. Luke help me, I want to get out of here.
Oh and by the way he's a disastrous business partner. I think he belongs
to a criminal organisation..."
evaluation3d.rating_reputation = 1
evaluation3d.rating_deal = 1
evaluation3d.rating_pitch = 1
evaluation3d.rating_competence = 1
evaluation3d.rating_commitment = 1
evaluation3d.amount_raised = 10_000 * rand(100)
evaluation3d.would_work_again = false
evaluation3d.save






investor4 = Investor.new
investor4.email = "obi-wan-kenobi@yopmail.com"
investor4.password = "12345678"
investor4.password_confirmation = "12345678"
investor4.save

profile4 = InvestorProfile.new
profile4.email = investor4.email
profile4.company_name = 'Obi-Wan Business Angel'
profile4.physical_address = "I'll appear when you need me"
profile4.phone_number = Faker::PhoneNumber.phone_number
profile4.facebook = Faker::Internet.url('facebook.com')
profile4.twitter = Faker::Internet.url('twitter.com')
profile4.linkedin = Faker::Internet.url('linkedin.com')
profile4.angellist = Faker::Internet.url('angel.co')
profile4.skype = Faker::Internet.user_name
profile4.website = 'www.obi-wan-kenobi.com'
profile4.sectors_invested_in = 'The Force, Lightsabers & brown gowns for grown men'
profile4.capital_under_managment = rand(101) * 100_000
profile4.geographical_focus = 'If you use the force there are no barriers'
profile4.preferred_investment_stage = "all stages of investment"
profile4.nb_projects_invested_in = rand(200)
profile4.contact_person = 'Obi-Wan Kenobi'
profile4.contact_email = investor4.email
profile4.contact_cell_phone = Faker::PhoneNumber.cell_phone
profile4.save

# i = profile4.find(index+1)
investor4.investor_profile = profile4
investor4.save

evaluation4b = Evaluation.new
evaluation4b.founder = founder1
evaluation4b.investor_profile = profile4
evaluation4b.title_review = 'I strongly recommend Obi-Wan Kenobi'
evaluation4b.review = " The last business we had together was a great success.
Our new spring collection for the Ewok's helped us create havoc in Ewok land.
Mr Obi-Wan-Kenobi is the business associate you want to work with"
evaluation4b.rating_reputation = 4
evaluation4b.rating_deal = 3
evaluation4b.rating_pitch = 4
evaluation4b.rating_competence = 4
evaluation4b.rating_commitment = 5
evaluation4b.amount_raised = 10_000 * rand(100)
evaluation4b.would_work_again = false
evaluation4b.save

evaluation4 = Evaluation.new
evaluation4.founder = admin
evaluation4.investor_profile = profile4
evaluation4.title_review = 'Mr Kenobi really helped me find the force'
evaluation4.review = " I came to Mr Kenobi with my white armour shine product.
I come from a background where there is little room for self-development and
Mr Kenobi not only helped me better define and sell my product, but he was
also a great coach and helped me find the creativity and the force that lied
within me. I don't know how to thank him for everything he's done. The business
is going fine, we have really managed to find and develop a niche product."
evaluation4.rating_reputation = 4
evaluation4.rating_deal = 3
evaluation4.rating_pitch = 4
evaluation4.rating_competence = 5
evaluation4.rating_commitment = 4
evaluation4.amount_raised = 10_000 * rand(100)
evaluation4.would_work_again = false
evaluation4.save

evaluation4a = Evaluation.new
evaluation4a.founder = founder1
evaluation4a.investor_profile = profile4
evaluation4a.title_review = 'Obi-Wan Kenobi is my master'
evaluation4a.review = " Wow, what else can I say. I was a boy and made me a man.
He came to get me in my small country village and transformed me into a real
jedi warrior. He taught me how to use a Lightsaber and he even showed me how to
cut my hair. This guy is the King!!"
evaluation4a.rating_reputation = 5
evaluation4a.rating_deal = 5
evaluation4a.rating_pitch = 5
evaluation4a.rating_competence = 5
evaluation4a.rating_commitment = 5
evaluation4a.amount_raised = 10_000 * rand(100)
evaluation4a.would_work_again = false
evaluation4a.save

evaluation4c = Evaluation.new
evaluation4c.founder = founder2
evaluation4c.investor_profile = profile4
evaluation4c.title_review = 'Obi-Wan Kenobi is the man'
evaluation4c.review = " Our business deal was great and the man is a star.
He helped me connect with loads of nice and friendly people. Thanks to him
we created a great team. He even introduced me to my long lost brother and
to my husband to be, Han Solo."
evaluation4c.rating_reputation = 4
evaluation4c.rating_deal = 3
evaluation4c.rating_pitch = 4
evaluation4c.rating_competence = 3
evaluation4c.rating_commitment = 4
evaluation4c.amount_raised = 10_000 * rand(100)
evaluation4c.would_work_again = false
evaluation4c.save


my_comments = ["This review is great it really helped me out, thanks",
"Wow, this is like deep and meaninful", "What did you mean exactly, you
write like a droid!!", "Can anyone tell me where the Ewok's are?",
"Your review hit me like a star-fighter", "What is this review? Did Jabba the
Hutt offer you girls and booze to write it?", "Use the force", "Never tell me the odds!",
"Well, you said you wanted to be around when I made a mistake.” “…I take it back!",
"Hmm! Adventure. Hmmpf! Excitement. A Jedi craves not these things.",
"Who’s the more foolish; the fool, or the fool who follows him?",
"STAY ON TARGET.", "That… is why you fail.", "Laugh it up, fuzzball!",
"I never doubted you! Wonderful!", "Would somebody get this big walking carpet out of my way?!",
]

Founder.all.each do |founder|
  Evaluation.all.each do |evaluation|
    comment = Comment.new
    comment.content = my_comments.sample
    comment.evaluation = evaluation
    comment.founder = founder
    comment.save

    vote = Vote.new
    direction = ["plus", "plus", "plus", "plus", "minus"].sample
    if direction == "plus"
      vote.plus = true
    else
      vote.minus = true
    end
    vote.evaluation = evaluation
    vote.founder = founder
    vote.save
  end
end

