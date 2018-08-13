FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    calories { Faker::Number.number(3) }
  end 
end