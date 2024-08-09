class AddUserIdToOrganizations < ActiveRecord::Migration[7.1]
  def change
    add_column :organizations, :user_id, :bigint
  end
end
