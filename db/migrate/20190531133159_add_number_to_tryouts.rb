class AddNumberToTryouts < ActiveRecord::Migration[5.2]
  def change
    add_column :tryouts, :number, :integer
  end
end
