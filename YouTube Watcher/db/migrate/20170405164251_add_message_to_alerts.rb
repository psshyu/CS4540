class AddMessageToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :message, :string
  end
end
