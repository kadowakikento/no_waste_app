FactoryBot.define do
  factory :food do
    name { 'お肉' }
    due_time { "2022-08-29 16:30" }
    association :user
  end

  factory :second_food, class: Food do
    name { '野菜' }
    due_time { "2022-08-28 01:30" }
    association :user
  end
end