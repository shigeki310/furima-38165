FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    title                  {}
    description            {}
    category_id            { :id 1 }
    item_status_id         { :id 1 }
    shipping_cost_id       { :id 1 }
    shipping_date_id       { :id 1 }
    prefecture_id          { :id 0 }

  end
end
