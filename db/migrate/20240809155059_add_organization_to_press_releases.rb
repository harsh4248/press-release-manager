class AddOrganizationToPressReleases < ActiveRecord::Migration[7.1]
  def change
    add_reference :press_releases, :organization, null: false, foreign_key: true
  end
end
