class Story < ActiveRecord::Base
  belongs_to :user
  
  validates :status, :presence => true
  validates :as_a, :presence => true
  validates :i_want_to, :presence => true
  validates :so_that, :presence => true
  validates :user_id, :presence => true
end
