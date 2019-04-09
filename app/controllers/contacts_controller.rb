class ContactsController < ApplicationController
  def create
    @contact = Contact.create!(contact_params)

    json_response(@contact, :created)
  end

  def index
    @contacts = Contact.all

    @contacts = @contacts.order(created_at: :desc).page params[:page]
  end

  private

  def contact_params
    params.permit(:name, :email, :guid)
  end
end
