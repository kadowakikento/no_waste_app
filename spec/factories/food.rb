FactoryBot.define do
  factory :food do
    user
    name { 'お肉' }
    due_time { "002022-08-25-16:30" }
    association :user
  end

  factory :second_food, class: Food do
    user
    name { '野菜' }
    due_time { "002022-08-25-16:30" }
    association :user
  end
end