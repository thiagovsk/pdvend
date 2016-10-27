class SitesController < ApplicationController
  def index
    respond_with(@sites = Site.all)
  end

  def create
    @site = Site.create(site_params)
    if @site.valid?
      respond_with(@site, location: sites_url)
    else
      respond_with(@site)
    end
  end

  private

  def site_params
    params.require(:site).permit(:url)
  end
end
