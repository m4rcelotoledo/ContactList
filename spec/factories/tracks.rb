FactoryBot.define do
  factory :track do
    guid { SecureRandom.uuid }
    visited_page { select_page }
    visited_datetime { Faker::Time.between(2.days.ago, Time.zone.today, :all) }
  end

  def select_page
    page_list = %w[Home Blog News About Contact]
    page_list[rand(page_list.length)]
  end
end
