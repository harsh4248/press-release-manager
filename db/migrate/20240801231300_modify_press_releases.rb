class ModifyPressReleases < ActiveRecord::Migration[7.1]
  def change
    # # Remove the unwanted columns
    # remove_column :press_releases, :users, :datatype_of_old_column1
    # remove_column :press_releases, :publisher, :datatype_of_old_column2
    
    # # Add references to user and publisher
    # add_reference :press_releases, :user, foreign_key: true
    # add_reference :press_releases, :publisher, foreign_key: true
  end
end
