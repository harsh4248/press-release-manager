class AddUserIdToPublishers < ActiveRecord::Migration[7.1]
  def change
    add_column :publishers, :user_id, :bigint
  end
end
