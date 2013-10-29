class NpcGroup < ActiveRecord::Base
  belongs_to :campaign
  has_many :npcs
end
