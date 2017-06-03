# spec/factories/events.rb
FactoryGirl.define do
  factory :event do
    sid { Faker::Number.between(1, 10) }
    cid { Faker::Number.between(1, 10) }
    status { Faker::Number.between(1, 10) }
    src_ip { Faker::Number.between(1, 10) }
    dst_ip { Faker::Number.between(1, 10) }
    src_port { Faker::Number.between(1, 10) }
    dst_port { Faker::Number.between(1, 10) }
    ip_proto { Faker::Number.between(1, 10) }
    signature { Faker::Lorem.sentence }
    timestamp { Faker::Time.between(10.days.ago, Date.today, :all) }
  end
end
