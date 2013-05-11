class AddPriorityColumnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :priority, :string
  end
end
