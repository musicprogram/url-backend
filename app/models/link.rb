class Link < ApplicationRecord
  validates :link, presence: true
  validates :title, presence: true
  validates_length_of :title, minimum: 5, allow_blank: true

  belongs_to :user
end
