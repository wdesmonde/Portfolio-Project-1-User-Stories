class Priority < ActiveRecord::Base
  has_many :stories
  # NOTE: has_many :tasks, :order => 'priority DESC'
  attr_accessible :id, :name, :priority_order
end
