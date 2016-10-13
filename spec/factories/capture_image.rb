include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :capture_image do

    trait :main do
      satus "main_image"
    end

    trait :image do
      image_url { fixture_file_upload("spec/fixtures/img/aaaa.png") }
    end

    trait :image_blank do
      image_url ""
    end
    prototype_id ""

    association :prototype
    prototype nil
  end
end
