class ContactsController < ApplicationController
  def create
    @contact = Contact.create!(contact_params)

    json_response(@contact, :created)
  end

  private

  def contact_params
    params.permit(:name, :email, :guid)
  end
end
