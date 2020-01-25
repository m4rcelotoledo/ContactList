# frozen_string_literal: true

require 'rails_helper'

describe ContactsController, type: :controller do
  describe 'Params' do
    subject(:contact) { described_class.new }

    let(:params) do
      {
        email: Faker::Internet.unique.email,
        name: Faker::Books::Dune.character,
        guid: SecureRandom.uuid
      }
    end

    it do
      expect(contact).to permit(:email, :name, :guid).
        for(:create, params: params)
    end
  end

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template('index') }
  end

  it { is_expected.to use_before_action(:set_contact) }
end
