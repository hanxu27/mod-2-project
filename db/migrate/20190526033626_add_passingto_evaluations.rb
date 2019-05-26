class AddPassingtoEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :passing, :integer
  end
end
