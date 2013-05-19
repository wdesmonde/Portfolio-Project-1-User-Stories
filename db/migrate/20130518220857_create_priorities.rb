class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end

    Priority.new(:name => 'High', :order => 10).save!
    Priority.new(:name => 'Medium', :order => 20).save!
    Priority.new(:name => 'Low', :order => 30).save!
  end
end
