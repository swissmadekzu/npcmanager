class Npc < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :npc_group
end
