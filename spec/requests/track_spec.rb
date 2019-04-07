require 'rails_helper'

RSpec.describe 'Track', type: :request do
  describe 'POST /track' do
    let(:guid) { SecureRandom.uuid }
    let(:visited_page) { select_page }
    let(:visited_datetime) { Faker::Time.between(2.days.ago,Date.today, :all) }
    let(:valid_attributes) do
      {
        guid: guid,
        visited_page: visited_page,
        visited_datetime: visited_datetime
      }
    end

    context 'when the request is valid' do
      before { post '/tracks', params: valid_attributes }

      it 'creates a new contact' do
        expect(json['guid']).to eq guid
        expect(json['visited_page']).to eq visited_page
        expect(json['visited_datetime'].to_time.utc).to eq visited_datetime
      end

      it { expect(response).to have_http_status :created }
    end
  end
end

def select_page
  page_list = ['Home', 'Blog', 'News', 'About', 'Contact']
  page_list[rand(page_list.length)]
end
