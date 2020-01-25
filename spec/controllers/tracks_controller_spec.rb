# frozen_string_literal: true

require 'rails_helper'

describe TracksController, type: :controller do
  describe 'Params' do
    subject(:track) { described_class.new }

    let(:params) do
      {
        guid: SecureRandom.uuid,
        visited_page: 'Home',
        visited_datetime: Faker::Time.between_dates(
          from: 2.days.ago, to: Time.zone.today, period: :all
        )
      }
    end

    it do
      expect(track).to permit(:guid, :visited_page, :visited_datetime).
        for(:create, params: params)
    end
  end

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template('index') }
  end
end
