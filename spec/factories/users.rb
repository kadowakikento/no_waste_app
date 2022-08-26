FactoryBot.define do
  factory :user do
    email { "test1@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end

  factory :second_user, class: User do
    email { "test2@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" } 
  end
end