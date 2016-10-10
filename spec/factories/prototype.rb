FactoryGirl.define do
	factory :prototype do
		title {Faker::Name.title}
		catchcopy {Faker::Name.title}
		concept {Faker::Name.title}
		created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
	end
end

