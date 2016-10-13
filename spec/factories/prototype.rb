FactoryGirl.define do
  factory :prototype do
    title {Faker::Name.title}
    catchcopy {Faker::Name.title}
    concept {Faker::Name.title}
  end
  # factory :prototype_with_capture_image, class: Prototype do
  #   title {Faker::Name.title}
  #   catchcopy {Faker::Name.title}
  #   concept {Faker::Name.title}

  #   after( :create ) do |prototype|
  #     create :capture_image, prototype: prototype
  #   end
  # end
end

