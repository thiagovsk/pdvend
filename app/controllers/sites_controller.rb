class SitesController < ApplicationController
  def index
    @sites = {}
    Site.all.each do |site|
      @sites[site.url] = site.tags
    end
    respond_with(@sites)
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
