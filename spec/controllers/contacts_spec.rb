require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'Params' do
    it do
      params = {
        email: Faker::Internet.unique.email,
        name: Faker::Books::Dune.character,
        guid: SecureRandom.uuid
      }
      should permit(:email, :name, :guid).
        for(:create, params: params)
    end
  end

  describe 'GET #index' do
    before { get :index }

    it { should render_template('index') }
  end

  it { should use_before_action(:set_contact) }
end
