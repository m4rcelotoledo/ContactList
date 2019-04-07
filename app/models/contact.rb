class Contact < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :name, presence: true
end
