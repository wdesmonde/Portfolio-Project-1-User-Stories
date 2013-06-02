class Story < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
  attr_writer :tags_to_add, :tags_to_remove
  
  validates :status_id, :presence => true
  validates :priority_id, :presence => true #, :inclusion => { :in => %w(High Medium Low) }
  validates :as_a, :presence => true
  validates :i_want_to, :presence => true
  validates :so_that, :presence => true
  validates :user_id, :presence => true
  
  # returns the stories which have tags of a given name
  def self.tagged_with(name)
    Tag.find_by_name!(name).stories
  end

  # returns a list of tags sorted in ascending order by tag name 
  # with the number of stories which have that tag.  This was originally
  # based upon the rails cast commemts
  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name").order("tags.name ASC")
  end


  # returns a string with all the tags we have
  # for a particular story
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  # sets the tag(s) for a story
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  # add tags
  def tags_to_add=(names)
    self.tags << names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  # remove a tag
  def tags_to_remove=(names)
    names.split(",").map do |n|
      self.tags.delete Tag.where(name: n.strip)
#      Tag.where(name: n.strip).first
    end
  end

end
