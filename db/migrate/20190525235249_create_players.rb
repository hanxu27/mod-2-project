class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.datetime :birthday
      t.integer :height
      t.string :hand
      t.string :school
      t.string :parent_name
      t.string :parent_number
      t.string :parent_address
      t.string :position_1
      t.string :position_2
      t.text :playing_experience
      t.text :additional_comments
      t.string :img_path
      t.references :team, foreign_key: true, optional: true
      t.string :password_digest

      t.timestamps
    end
  end
end
