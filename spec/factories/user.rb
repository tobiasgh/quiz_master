FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password(8)

    factory :teacher do
      role I18n.t('user.roles.teacher')
    end

    factory :student do
      role I18n.t('user.roles.teacher')
    end
  end
end
