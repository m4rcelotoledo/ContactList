require 'rails_helper'

RSpec.describe Contact, type: :model do
  it do
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
    should validate_presence_of(:name)
  end
end
