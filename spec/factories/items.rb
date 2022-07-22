FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    title                  {Faker::Name}
    description            {Faker::Lorem.sentence}
    category_id            {'3'}
    item_status_id         {'3'}
    shipping_cost_id       {'3'}
    shipping_date_id       {'3'}
    prefecture_id          {'3'}
    price                  {'3000'}

  end
end
