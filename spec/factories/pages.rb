FactoryGirl.define do
  factory :page do
    url { "http://example.com" }
    content { 
      { 
        h1: Faker::Lorem.sentence,
        h2: Faker::Lorem.sentence,
        h3: Faker::Lorem.sentence,
        href: Faker::Internet.url
      }
    }
  end
end