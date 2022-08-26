FactoryBot.define do
  factory :food, class :Food do
    user
    name { 'お肉' }
    due_time { "2022-08-05 08:30" }
    
    # association :user
    
  end

  factory :second_food, class :Food do
    user
    name { '野菜' }
    due_time { "2022-08-06 10:30" }
    
    # association :user
  end
end
end