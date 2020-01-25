# frozen_string_literal: true

require 'rails_helper'

describe Track, type: :model do
  it { is_expected.to validate_presence_of(:guid) }
  it { is_expected.to validate_presence_of(:visited_page) }
  it { is_expected.to validate_presence_of(:visited_datetime) }
end
