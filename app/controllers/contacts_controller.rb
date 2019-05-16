class ContactsController < ApplicationController
  # POST /contacts
  def create
    @contact = Contact.create!(contact_params)

    json_response(@contact, :created)
  end

  def index
    @contacts = Contact.order(created_at: :desc).page params[:page]
  end

    @contacts = @contacts.order(created_at: :desc).page params[:page]
  end

  private

  def contact_params
    params.permit(:email, :name, :guid)
  end
end
