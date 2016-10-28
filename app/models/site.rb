require 'open-uri'
class Site < ActiveRecord::Base
  has_many :tags

  validates :url, presence: true, format: { with: URI.regexp }

  after_commit :generate_tags

  def generate_tags
    page = Nokogiri::HTML(open(url))
    page.search('h1, h2, h3').map do |node|
      Tag.create(site_id: id, name: node.name, content: node.text)
    end
  end
end
