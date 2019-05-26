class CreateTryouts < ActiveRecord::Migration[5.2]
  def change
    create_table :tryouts do |t|
      t.string :season
      t.boolean :forms_completed
      t.boolean :paid
      t.integer :reach
      t.integer :approach_jump
      t.integer :block_jump
      t.integer '3_point_touch'
      t.integer '30_feet_dash'
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
