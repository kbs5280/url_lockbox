class Url < ApplicationRecord
  belongs_to :user

  # validates :title, uniqueness: true
  # validates :url, url: true
end
