class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :as_a
      t.text :i_want_to
      t.text :so_that

      t.timestamps
    end
  end
end
