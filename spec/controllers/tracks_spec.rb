require 'rails_helper'

RSpec.describe TracksController, type: :controller do
  describe 'Params' do
    it do
      params = {
        guid: SecureRandom.uuid,
        visited_page: 'Home',
        visited_datetime: Faker::Time.between_dates(
          from: 2.days.ago, to: Time.zone.today, period: :all
        )
      }
      should permit(:guid, :visited_page, :visited_datetime).
        for(:create, params: params)
    end
  end

  describe 'GET #index' do
    before { get :index }

    it { should render_template('index') }
  end
end
