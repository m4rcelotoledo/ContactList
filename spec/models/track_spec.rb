require 'rails_helper'

RSpec.describe Track, type: :model do
  it do
    should validate_presence_of(:guid)
    should validate_presence_of(:visited_page)
    should validate_presence_of(:visited_datetime)
  end
end
