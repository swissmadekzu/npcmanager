class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :npcs, dependant: :destroy
  has_many :npc_groups, dependant: :destroy
end
