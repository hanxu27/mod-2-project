class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :coachability
      t.integer :athleticism
      t.integer :serve
      t.integer :sr
      t.integer :setting
      t.integer :hitting
      t.integer :communication
      t.integer :vball_iq
      t.string :team
      t.text :comments
      t.references :tryout, foreign_key: true
      t.references :coach, foreign_key: true

      t.timestamps
    end
  end
end
