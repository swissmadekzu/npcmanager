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

  def edit
    @campaign = current_user.campaigns.find(params[:id])
  end

  def update
    @campaign = current_user.campaigns.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      flash[:notice] = "Campagne mise à jour avec succès"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = "Une erreur est survenue lors de la mise à jour de la campagne"
      render action: :edit
    end
  end

  def destroy
    @campaign = current_user.campaigns.find(params[:id])
    if @campaign.destroy
      flash[:notice] = "Campagne supprimée avec succès"
      redirect_to campaigns_path
    else
      flash[:error] = "Une erreur est survenue lors de la suppression de la campagne"
      redirect_to campaigns_path
    end
  end

  private
  def campaign_params
    params.require(:campaign).permit(:name, :user_id)
  end

end
