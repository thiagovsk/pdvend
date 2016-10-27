require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  let(:site_params) { FactoryGirl.build(:site).attributes.as_json }
  let!(:site) { FactoryGirl.create(:site) }

  describe 'GET #index /sites' do
    it 'returns http success' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it 'returns site' do
      get :index, format: :json
      expect(response.body).to include(site.attributes.to_json)
    end
  end

  describe 'POST #create /sites.json' do
    context 'with valid params' do
      it 'returns http success' do
        post :create, format: :json, site: site_params
        expect(response).to have_http_status(:success)
      end

      it 'creates a new site' do
        expect { post :create, format: :json, site: site_params }.to change(Site, :count).by(1)
      end

      it 'assigns a newly created site as @site' do
        post :create, format: :json, site: site_params
        expect(assigns(:site)).to be_a(Site)
        expect(assigns(:site)).to be_persisted
      end
    end
  end
end
