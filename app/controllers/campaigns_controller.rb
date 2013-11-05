class CampaignsController < ApplicationController

  before_action :require_login

  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = current_user.campaigns.find(params[:id])
  end

  def new
    @campaign = current_user.campaigns.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    if @campaign.save
      flash[:notice] = "Campagne créée avec succès !"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = "Une erreur est survenue lors de la création de la campagne."
      render action: :new
    end
  end

end
