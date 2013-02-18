class Story < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  
  validates :status, :presence => true
  validates :as_a, :presence => true
  validates :i_want_to, :presence => true
  validates :so_that, :presence => true
  validates :user_id, :presence => true
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).stories
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      # joins(:taggings).group("taggings.tag_id")
      joins(:taggings).group("tags.id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
