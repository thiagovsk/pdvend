require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tags) }
  end
  describe 'validations' do
   it { is_expected.to validate_presence_of(:url) }
   it { is_expected.to allow_value('http://foo.com').for(:url) }
  end
end
