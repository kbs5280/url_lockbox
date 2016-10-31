class Url < ApplicationRecord
  belongs_to :user

  validates :url, url: true
end
