class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end

    Status.new(:name => 'In Progress', :order => 10).save!
    Status.new(:name => 'Not Started', :order => 20).save!
    Status.new(:name => 'Test', :order => 30).save!
    Status.new(:name => 'Backlog', :order => 40).save!
    Status.new(:name => 'Done', :order => 50).save!
  end
end
