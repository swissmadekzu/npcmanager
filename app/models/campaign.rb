class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :npcs
  has_many :npc_groups
end
