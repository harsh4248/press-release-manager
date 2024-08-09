class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.string :name
      t.text :description
      t.string :website_url

      t.timestamps
    end
  end
end
