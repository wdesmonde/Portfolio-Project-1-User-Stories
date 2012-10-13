class AddNotesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :notes, :text
  end
end
