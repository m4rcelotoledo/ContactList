require 'rails_helper'

RSpec.describe 'Track', type: :request do
  describe 'POST /tracks' do
    let(:guid) { SecureRandom.uuid }
    let(:visited_page) { select_page }
    let(:visited_datetime) do
      Faker::Time.between(2.days.ago, Time.zone.today, :all)
    end

    context 'when the request is valid' do
      let(:valid_attributes) do
        {
          guid: guid,
          visited_page: visited_page,
          visited_datetime: visited_datetime
        }
      end

      before { post '/tracks', params: valid_attributes }

      it 'creates a new contact' do
        expect(json['guid']).to eq guid
        expect(json['visited_page']).to eq visited_page
        expect(json['visited_datetime'].to_time.utc).to eq visited_datetime
      end

      it { expect(response).to have_http_status :created }
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) do
        {
          guid: guid,
          visited_datetime: visited_datetime
        }
      end

      before { post '/tracks', params: invalid_attributes }

      it 'returns status :unprocessable_entity (422)' do
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to match(/failed: Visited page can't be blank/)
      end
    end
  end

  describe 'GET /tracks/:id' do
    context 'when the record does not exist' do
      before { get '/tracks/1000' }

      it 'returns status :not_found (404)' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Track/)
      end
    end

    context 'when the record exists' do
      let(:track) { create(:track) }

      before { get "/tracks/#{track.id}" }

      it 'returns the track' do
        expect(json).not_to be_empty
        expect(json['id']).to eq track.id
      end

      it 'returns status :ok (200)' do
        expect(response).to have_http_status :ok
      end
    end
  end
end

def select_page
  page_list = %w[Home Blog News About Contact]
  page_list[rand(page_list.length)]
end
