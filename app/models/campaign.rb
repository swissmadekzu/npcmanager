class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :npcs, dependent: :destroy
  has_many :npc_groups, dependent: :destroy
end
