class Site < ActiveRecord::Base
  has_many :tags
  validates :url, presence: true, format: { with: URI.regexp }
end
