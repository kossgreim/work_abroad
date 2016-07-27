FactoryGirl.define do
  factory :client do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    country { Faker::Address.country }
    city { Faker::Address.city }
    birthday { Faker::Date.between(50.years.ago, 18.years.ago) }
    occupation { Faker::Company.profession }
    gender 1
  end
end
