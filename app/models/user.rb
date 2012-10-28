class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me_token
  
  has_many :stories

  validates_presence_of :username, :on => :create

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :email, :on => :create,
    :presence => true,
    :format => { :with => email_regex },
    :uniqueness => { :case_sensitive => false }
  validates :password, :on => :create,
    :presence => true,
    :confirmation => true,
    :length => { :within => 6..40 }
end