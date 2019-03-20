class SitesController < ApplicationController
  before_action :set_site, only: %i[show edit update destroy]


  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = check_for_site
    respond_to do |format|
      if @site.save
        #flash[:notice] = 'Customer Site was successfully created!'
        #format.html {redirect_to @site}
        format.any(:js,:json) {render json: {site: @site, sites: Site.all_sites_with_pos}}
      else
        #flash[:alerts] = @site.errors.full_messages
        #format.html {redirect_to @site}
        format.any(:js,:json) {render json: @site.to_json}
      end
    end
  end

  def update
    respond_to do |format|
      if @site.update(site_params)
        #flash[:notice] = 'Customer Site was successfully updated!'
        #format.html { redirect_to @site }
        format.any(:json,:js) {render json: {site: @site, sites: Site.all_sites_with_pos}}
      else
        #flash[:alerts] = @site.errors.full_messages
        #format.html { redirect_to edit_site_path(@site) }
        format.any(:json,:js) {render json: @site}
      end
    end
  end

  def show
    @success = true
  end

  def index
    @sites = Site.all
  end

  def destroy
    if @site.destroy
      #flash[:notice] = 'Site destroyed successfully'
      redirect_to maps_path
    else
      #flash[:alerts] = @site.errors.full_messages
      #redirect_to maps_path
    end
  end

  def with_pos
    respond_to do |format|
      format.any(:js,:json){render json: Site.all_sites_with_pos}
    end
  end


  private

  #TODO: finding by lat is terrible
  def check_for_site
    if(Site.find_by_lat(site_params['lat']))
      site = Site.find_by_lat(site_params['lat'])
      site.attributes = site_params
      return site
    else
      return Site.new(site_params)
    end
  end

  def site_params
    params.require(:site).permit(
      :id,
      :first_name,
      :last_name,
      :address,
      :lat,
      :lng,
      :phone,
      :notes,
      :icon_url,
      :pos,
      :email
      #:emails => [],
    )
  end

  def set_site
    @site = Site.find(params[:id])
  end
end
