class NpcsController < ApplicationController

  def show
    @npc = Npc.find(params[:id])  
  end

  def new
    redirect_to :back if params[:campaign_id].blank?
    @campaign = Campaign.find(params[:campaign_id])
    @npc = @campaign.npcs.new
  end

  def create
    @campaign = Campaign.find(params[:npc][:campaign_id])
    @npc = @campaign.npcs.new(npc_params)
    if @npc.save
      flash[:notice] = "Le PNJ a été créé avec succès"
      redirect_to npc_path(@npc)
    else
      flash[:error] = "Le PNJ n'a pas pu être créé"
      redirect_to campaign_path(@campaign)
    end
  end

  def edit
    @npc = Npc.find(params[:id])
    @campaign = @npc.campaign
  end

  def update
    @npc = Npc.find(params[:id])
    if @npc.update_attributes(npc_params)
      flash[:notice] = "Le PNJ a été mis à jour avec succès"
      redirect_to npc_path(@npc)
    else
      flash[:error] = "Le PNJ n'a pas pu être mis à jour"
      redirect_to npc_path(@npc)
    end
  end

  def destroy
    @npc = Npc.find(params[:id])
    @campaign = @npc.campaign
    if @npc.destroy
      flash[:notice] = "Le PNJ a été supprimé avec succès"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = "Le PNJ n'a pas pu être supprimé"
      redirect_to npc_path(@npc)
    end
  end

  private
  def npc_params
    params.require(:npc).permit(:name, :campaign_id, :npc_group_id, :catchphrase, :temper, :description)
  end

end
