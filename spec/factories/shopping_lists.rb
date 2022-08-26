FactoryBot.define do
  factory :shopping_list do
    title { 'ラーメン' }
    content { '醤油' }
    user_id { 1 }
    association :user
  end

  factory :second_shopping_list, class :ShoppingList do
    title { '白米' }
    content { 'コシヒカリ' }
    user_id { 2 }
    association :user
  end
end