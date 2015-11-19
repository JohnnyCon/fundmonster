class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :image
      t.integer :goal
      t.integer :pledged, default: 0
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end
