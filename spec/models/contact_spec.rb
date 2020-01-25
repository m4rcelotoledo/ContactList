# frozen_string_literal: true

require 'rails_helper'

  it do
    should validate_uniqueness_of(:email)
    should validate_presence_of(:email)
    should validate_presence_of(:name)
    should validate_presence_of(:guid)
  end
describe Contact, type: :model do
end
