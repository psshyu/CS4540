class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.integer :status
      t.timestamp :delivered_at

      t.timestamps
    end
  end
end
