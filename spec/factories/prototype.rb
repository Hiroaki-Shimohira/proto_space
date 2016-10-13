FactoryGirl.define do
  factory :prototype do
    title {Faker::Name.title}
    catchcopy {Faker::Name.title}
    concept {Faker::Name.title}
  end
end

