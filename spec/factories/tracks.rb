FactoryBot.define do
  factory :track do
    guid { SecureRandom.uuid }
    visited_page do
      page_list = %w[Home Blog News About Contact]
      page_list[rand(page_list.length)]
    end
    visited_datetime { Faker::Time.between(2.days.ago, Time.zone.today, :all) }
  end
end
