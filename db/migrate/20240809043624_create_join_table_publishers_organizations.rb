class CreateJoinTablePublishersOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_join_table :publishers, :organizations do |t|
      t.index [:publisher_id, :organization_id]
      t.index [:organization_id, :publisher_id]
    end
  end
end
