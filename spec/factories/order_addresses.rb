FactoryBot.define do
  factory :order_address do

    postal_code      {'123-4567'}
    prefecture_id    {'3'}
    city             {'横浜市'}
    block            {'青山１−１−１'}
    building         {'ハイツ青山'}
    phone_number     {'09011112222'}
    token            {'tok_abcdefghijk00000000000000000'}
    
  end
end
