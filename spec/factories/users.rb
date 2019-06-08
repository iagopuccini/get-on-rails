FactoryBot.define do
  factory :user do
    email { 'email@email.com' }

    after(:build) { |u| u.password_confirmation = u.password = 'passwd' }
  end

   factory :other_user, class: User do
    email { 'other_email@email.com' }

    after(:build) { |u| u.password_confirmation = u.password = 'passwd' }
  end
end
