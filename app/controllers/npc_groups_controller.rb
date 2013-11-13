class NpcGroupsController < ApplicationController

  def show
    @npc_group = NpcGroup.find(params[:id])  
  end

  def new
    redirect_to :back if params[:campaign_id].blank?
    @campaign = Campaign.find(params[:campaign_id])
    @npc_group = @campaign.npc_groups.new
  end

  def create
    @campaign = Campaign.find(params[:npc_group][:campaign_id])
    @npc_group = @campaign.npc_groups.new(npc_group_params)
    if @npc_group.save
      flash[:notice] = "Le groupe de PNJ a été créé avec succès"
      redirect_to npc_group_path(@npc_group)
    else
      flash[:error] = "Le groupe de PNJ n'a pas pu être créé"
      redirect_to campaign_path(@campaign)
    end
  end

  def edit
    @npc_group = NpcGroup.find(params[:id])
    @campaign = @npc_group.campaign
  end

  def update
    @npc_group = NpcGroup.find(params[:id])
    if @npc_group.update_attributes(npc_group_params)
      flash[:notice] = "Le groupe de PNJ a été mis à jour avec succès"
      redirect_to npc_group_path(@npc_group)
    else
      flash[:error] = "Le groupe de PNJ n'a pas pu être mis à jour"
      redirect_to npc_group_path(@npc_group)
    end
  end

  def destroy
    @npc_group = NpcGroup.find(params[:id])
    @campaign = @npc_group.campaign
    if @npc_group.destroy
      flash[:notice] = "Le groupe de PNJ a été supprimé avec succès"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = "Le groupe de PNJ n'a pas pu être supprimé"
      redirect_to npc_group_path(@npc_group)
    end
  end

  private
  def npc_group_params
    params.require(:npc_group).permit(:name, :campaign_id, :goals, :powers)
  end

end
