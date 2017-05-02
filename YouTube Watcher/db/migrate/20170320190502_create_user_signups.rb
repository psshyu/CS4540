class CreateUserSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_signups do |t|

      t.timestamps
    end
  end
end
