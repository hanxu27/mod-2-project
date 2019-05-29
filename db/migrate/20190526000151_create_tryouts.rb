class CreateTryouts < ActiveRecord::Migration[5.2]
  def change
    create_table :tryouts do |t|
      t.integer :season
      t.boolean :forms_completed
      t.boolean :paid
      t.integer :reach
      t.integer :approach_jump
      t.integer :block_jump
      t.float 'point_touch'
      t.float 'dash'
      t.integer :age_group
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
