class AddFlagToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :flag, :boolean
  end
end
