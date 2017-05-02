class AddTextInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :txt_number, :string
    add_column :users, :verified, :boolean, default: false
  end
end
