class Track < ApplicationRecord
  validates :guid, :visited_page, :visited_datetime, presence: true
end
