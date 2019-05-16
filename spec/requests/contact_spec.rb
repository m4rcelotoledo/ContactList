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

  describe 'GET /contacts/:id' do
    context 'when the record does not exist' do
      before { get '/contacts/1000' }

      it 'returns status :not_found (404)' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end

    context 'when the record exists' do
      let(:contact) { create(:contact) }

      before { get "/contacts/#{contact.id}" }

      it 'returns the contact' do
        expect(json).not_to be_empty
        expect(json['id']).to eq contact.id
      end

      it 'returns status :ok (200)' do
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'PUT /contacts/:id' do
    context 'when the record does not exist' do
      before { put '/contacts/1000' }

      it 'returns status :not_found (404)' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end

    context 'when the record exists' do
      let(:email) { Faker::Internet.unique.email }
      let(:contact) { create(:contact) }
      let(:valid_attributes) { { email: email } }

      before { put "/contacts/#{contact.id}", params: valid_attributes }

      it 'updates the contact' do
        contact.reload
        expect(contact.email).to eq email
      end

      it 'returns status :no_content (204)' do
        expect(response).to have_http_status :no_content
      end
    end
  end
end
