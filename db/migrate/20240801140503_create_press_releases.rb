class CreatePressReleases < ActiveRecord::Migration[7.1]
  def change
    create_table :press_releases do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date
      t.references :users, null: false, foreign_key: true
      # t.references :publishers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
