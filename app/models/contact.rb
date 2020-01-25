# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :name, :guid, presence: true
end
