class Contact < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :name, :guid, presence: true
end
