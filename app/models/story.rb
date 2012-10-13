class Story < ActiveRecord::Base
  validates :status, :presence => true
  validates :as_a, :presence => true
  validates :i_want_to, :presence => true
  validates :so_that, :presence => true
end
