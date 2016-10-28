require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tags) }
  end

  describe 'validations' do
   it { is_expected.to validate_presence_of(:url) }
   it { is_expected.to allow_value('http://foo.com').for(:url) }
  end

  describe 'instance methods' do
    context '.generate_tags' do
      it 'create site with tags in database' do
        site = Site.new(url: "http://globo.com")
        site.generate_tags
        expect(Tag.all.count).not_to eq(0)
      end
    end
  end
end
