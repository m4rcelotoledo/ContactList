require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  describe 'POST /contacts' do
    let(:name) { Faker::Books::Dune.character }
    let(:email) { Faker::Internet.unique.email }
    let(:guid) { SecureRandom.uuid }
    let(:valid_attributes) do
      {
        name: name,
        email: email,
        guid: guid
      }
    end

    context 'when the request is valid' do
      before { post '/contacts', params: valid_attributes }

      it 'creates a new contact' do
        expect(json['name']).to eq name
        expect(json['email']).to eq email
        expect(json['guid']).to eq guid
      end

      it { expect(response).to have_http_status :created }
    end
  end
end
