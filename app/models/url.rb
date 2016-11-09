class Url < ApplicationRecord
  belongs_to :user
  has_many :url_tags
  has_many :tags, through: :url_tags

  validates :title, uniqueness: true
  validates :url, url: true
end
