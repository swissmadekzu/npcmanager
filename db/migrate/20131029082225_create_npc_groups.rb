class CreateNpcGroups < ActiveRecord::Migration
  def change
    create_table :npc_groups do |t|
      t.string :name
      t.belongs_to :campaign, index: true
      t.text :goals
      t.text :powers

      t.timestamps
    end
  end
end
