class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string :name
      t.belongs_to :campaign, index: true
      t.belongs_to :npc_group, index: true
      t.text :description
      t.string :catchphrase
      t.text :temper

      t.timestamps
    end
  end
end
