class AddSnsMessageIdToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :sns_message_id, :string
  end
end
