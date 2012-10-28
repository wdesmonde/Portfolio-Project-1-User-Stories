class AddUserToStories < ActiveRecord::Migration
  class Story < ActiveRecord::Base
    # Just to prevent the validations in the real class from running during this migration.
  end
  def change
    add_column  :stories, :user_id,  :integer
    Story.reset_column_information
    Story.all.each do |s|
      s.update_attributes!(:user_id => 1)
    end
  end
end
