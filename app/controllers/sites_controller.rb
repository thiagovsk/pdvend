class SitesController < ApplicationController
  def index
    respond_with(@sites = Site.all, status: :ok)
  end

  def create
    @site = Site.create(site_params)
    if @site.valid?
      respond_with(@site, location: api_v1_sites_url)
    else
      respond_with(@site)
    end
  end

  private

  def site_params
    params.require(:site).permit(:url)
  end
end
