class Story < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
  
  validates :status, :presence => true
  validates :as_a, :presence => true
  validates :i_want_to, :presence => true
  validates :so_that, :presence => true
  validates :user_id, :presence => true
  
  # returns the stories which have tags of a given name
  def self.tagged_with(name)
    Tag.find_by_name!(name).stories
  end

  # returns a list of tags with the number of stories
    #  which have that tag
    #  does not work
  def self.tag_counts_broken
    Tag.select("tags.*, count(taggings.tag_id) as count").
      # joins(:taggings).group("taggings.tag_id")
      joins(:taggings).group("tags.id")
  end

# from the rails cast commemts
  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
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
end
