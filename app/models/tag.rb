class Tag < ApplicationRecord
  has_many :url_tags
  has_many :urls, through: :url_tags
end
