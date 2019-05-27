class AddAgeGroupToTryouts < ActiveRecord::Migration[5.2]
  def change
    add_column :tryouts, :age_group, :integer
  end
end
