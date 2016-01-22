User.destroy_all
Receipt.destroy_all
ComplaintStatus.destroy_all

50.times do
  user_password = Faker::Internet.password
  u = User.create(email: Faker::Internet.email,
                  password: user_password,
                  password_confirmation: user_password,
                  admin: [true, false].sample)

  #phone_number format: +99 999-999-999
  s = Shop.find_or_create_by(name: Faker::Company.name,
              street: Faker::Address.street_name,
              city: Faker::Address.city,
              email: Faker::Internet.email,
              telephone: Faker::Base.numerify('+48 ###-###-###'),
              user: u,
              latitude: Faker::Address.latitude,
              longitude: Faker::Address.longitude,
              overall_rating: rand(1.0..5))

  r = Receipt.create(shopping_date: Faker::Time.between(DateTime.now - 30, DateTime.now),
                shop: s,
                user: u,
                file: Faker::Avatar.image,
                name: Faker::Commerce.product_name
  )

  a = Article.find_or_create_by(name: Faker::Commerce.product_name,
                 brand: Faker::Commerce.department,
                 warranty_time:rand(30..90),
                 warranty_expires: Faker::Time.between(DateTime.now, DateTime.now+rand(30..90)),
                 already_complained: [true,false].sample,
                 user: u,
                 receipt: r )

  complaint_status = ComplaintStatus.create( [{name: 'Oczekuje na zaakceptowanie'}, {name: 'Odrzucona przez administratora'},
                           {name: 'W toku (zaakceptowana przez administratora)'},
                           {name: 'Uznana'},  {name: 'Nieuznana'}   ] )


  c = Complaint.find_or_create_by(reason: Faker::Lorem.sentence,
                   user: u,
                   already_reviewed: [true,false].sample,
                   article: a,
                   complaint_status: complaint_status[rand(0..4)] )

  ComplaintReview.find_or_create_by(user: u,
                        comment: Faker::Lorem.sentence,
                        complaint: c,
                        examination_time: rand(1..5),
                        client_approach: rand(1..5),
                        satisfaction: rand(1..5))


end