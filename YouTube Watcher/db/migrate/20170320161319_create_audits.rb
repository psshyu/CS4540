class CreateAudits < ActiveRecord::Migration[5.0]
  def change
    create_table :audits do |t|
      t.integer :category
      t.string :title
      t.text :details
      t.integer :severity

      t.timestamps
    end
  end
end
