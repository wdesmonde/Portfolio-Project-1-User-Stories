require 'spec_helper'
  #pp is "pretty print" prints it in a nicer way

require 'pp'

   #allows using the debugger
   #  you can go into the ruby debugger, which is for
   #  debugging ruby
require 'ruby-debug'


Capybara.configure do |config| 
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end

#  the puts strings appears at the top of the test results
puts "smoke_tests_spec-DEBUG:Capybara.default_selector=#{Capybara.default_selector}"
#puts Capybara.default_selector
# this is NOT the way to change the default selector
#   but it might be a way to have Capybara search via id
#Capybara.default_selector = id
#puts Capybara.default_selector

describe "New Story Tests" do
  fixtures :all
  before(:each) do
    @user = {
      :name =>   "Some Won",
      :email =>  "somewon@example.com",
      :password => "foolishbar"
    }
    @new_story = {
      :tags => "test",
      :as_a => "user",
      :i_want_to => "test this application",
      :so_that => "I am sure it works",
      :notes => "a = 440"
    }

    visit "/signup"
    fill_in('user_username', :with => @user[:name])
    fill_in('user_email', :with => @user[:email])
    fill_in('user_password', :with => @user[:password])
    fill_in('user_password_confirmation', :with => @user[:password])
    click_button "Create User"

    visit "/login"
    #save_and_open_page
    fill_in('email', :with => @user[:email])
    fill_in('password', :with => @user[:password])
    click_button "Log in"
  end    

  describe "create story" do

    describe "create new story" do
      it "should create a new story with only valid text fields" do
        lambda do
          #save_and_open_page
          first(:link, "New Story").click
          fill_in('story_tag_list', :with => @new_story[:tags])
          fill_in('story_as_a', :with => @new_story[:as_a])
          fill_in('story_i_want_to', :with => @new_story[:i_want_to])
          fill_in('story_so_that', :with => @new_story[:so_that])
          fill_in('story_notes', :with => @new_story[:notes])
          click_button "Create Story"
        end.should change(Story, :count)
       end # goes with the it should create
    end # goes with describe create new story

  end  # end describe create story

end  # end describe smoke tests
 
