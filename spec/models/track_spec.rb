# frozen_string_literal: true

require 'rails_helper'

  it do
    should validate_presence_of(:guid)
    should validate_presence_of(:visited_page)
    should validate_presence_of(:visited_datetime)
  end
describe Track, type: :model do
end
