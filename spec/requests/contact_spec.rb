require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  describe 'POST /contacts' do
    let(:email) { Faker::Internet.unique.email }
    let(:name) { Faker::Books::Dune.character }
    let(:guid) { SecureRandom.uuid }

    context 'when the request is valid' do
      let(:valid_attributes) do
        {
          email: email,
          name: name,
          guid: guid
        }
      end

      before { post '/contacts', params: valid_attributes }

      it 'creates a new contact' do
        expect(json['email']).to eq email
        expect(json['name']).to eq name
        expect(json['guid']).to eq guid
      end

      it { expect(response).to have_http_status :created }
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) do
        {
          email: email,
          name: name
        }
      end

      before { post '/contacts', params: invalid_attributes }

      it 'returns status :unprocessable_entity (422)' do
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to match(/failed: Guid can't be blank/)
      end
    end

    context 'when the email already exists' do
      let(:invalid_attributes) do
        {
          email: email,
          name: name,
          guid: guid
        }
      end

      before do
        create(:contact, email: email)
        post '/contacts', params: invalid_attributes
      end

      it 'returns status :unprocessable_entity (422)' do
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to match(/Email has already been taken/)
      end
    end
  end
end
