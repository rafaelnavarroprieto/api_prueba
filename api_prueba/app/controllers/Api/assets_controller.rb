class Api::AssetsController < ApplicationController
  before_action :set_assets, only: [:show, :update, :destroy]

  # GET /assets
  def index
    @assets = Asset.all
    json_response(@assets)
  end

  # POST /assets
  def create
    @assets = Asset.create!(asset_params)
    json_response(@assets, :created)
  end

  # GET /assets/:id
  def show
    json_response(@assets)
  end

  # PUT /assets/:id
  def update
    @assets.update(asset_params)
    head :no_content
  end

  # DELETE /assets/:id
  def destroy
    @assets.destroy
    head :no_content
  end

  private

  def asset_params
    # whitelist params
    params.permit(:notification_id)
  end

  def set_assets
    @assets = Asset.find(params[:id])
  end
end
