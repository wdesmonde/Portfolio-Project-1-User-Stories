class AddEnumeratableIdsToStories < ActiveRecord::Migration
  def change
    add_column  :stories, :status_id,  :integer
    add_column  :stories, :priority_id,  :integer
  end
end
