FactoryBot.define do
  factory :track do
    guid { SecureRandom.uuid }
    visited_page do
      page_list = %w[Home Blog News About Contact]
      page_list[rand(page_list.length)]
    end
    visited_datetime do
      Faker::Time.between_dates(from: 2.days.ago, to: Time.zone.today, period: :all)
    end
  end
end
