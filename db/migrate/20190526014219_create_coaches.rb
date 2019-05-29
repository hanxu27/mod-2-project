class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.boolean :admin
      t.references :team, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
