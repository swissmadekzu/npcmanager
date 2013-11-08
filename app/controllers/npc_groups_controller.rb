class NpcGroupController < ApplicationController

  def show
    
  end

  def new
    redirect_to :back if params[:campaign_id].blank?
    @campaign = Campaign.find(params[:campaign_id])
    @npc_group = @campaign.npc_groups.new
  end

  def create
    @campaign = Campaign.find(params[:npc_group][:campaign])
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
  end

end
