class ChangeAddressforPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :parent_adress, :string
    add_column :players, :parent_address, :string
  end
end
