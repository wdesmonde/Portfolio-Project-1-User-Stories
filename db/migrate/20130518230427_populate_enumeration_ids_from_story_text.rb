class PopulateEnumerationIdsFromStoryText < ActiveRecord::Migration
  def up
    Story.all.each do |s|
      s.status = s.status ? s.status : 'Backlog'
      sid = Status.where(:name => s.status).first
      sid = sid ? sid.id : Status.where(:name => 'Backlog').first.id

      s.priority = s.priority ? s.priority : 'Medium'
      pid = Priority.where(:name => s.priority).first
      pid = pid ? pid.id : Priority.where(:name => 'Medium').first.id

      # s.update_attributes!(:status_id => sid, :priority_id => pid)
      s.status_id = sid
      s.status = Status.find(sid).name
      s.priority_id = pid
      s.priority = Priority.find(pid).name
      s.save!

    end
  end
end
