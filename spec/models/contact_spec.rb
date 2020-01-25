# frozen_string_literal: true

require 'rails_helper'

describe Contact, type: :model do
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:guid) }
end
