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

describe "SmokeTests" do

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
  end

  describe "successful signup" do
    it "should create a new user" do
      lambda do
        visit "/signup"
        # save and open page requires the launchy gem
        #save_and_open_page
        fill_in('user_username', :with => @user[:name])
        fill_in('user_email', :with => @user[:email])
        fill_in('user_password', :with => @user[:password])
        fill_in('user_password_confirmation', :with => @user[:password])
        click_button "Create User"

        # verifications for the test
        #response.status.should be(200)
      end.should change(User, :count)
    end
  end

  describe "negative sign up cases" do
    it "should not create a new user if create user not clicked" do
      lambda do
        visit "/signup"
        #   note:  is is better to use "visit" rather than get
        #get "/signup"
        # save and open page requires the launchy gem
        #save_and_open_page
        fill_in('user_username', :with => @user[:name])
        fill_in('user_email', :with => @user[:email])
        fill_in('user_password', :with => @user[:password])
        fill_in('user_password_confirmation', :with => @user[:password])

        # verifications for the test
      end.should_not change(User, :count)
    end

    it "should not create a new user if passwords don't match" do
      lambda do
        visit "/signup"
        fill_in('user_username', :with => @user[:name])
        fill_in('user_email', :with => @user[:email])
        fill_in('user_password', :with => @user[:password])
        fill_in('user_password_confirmation', :with => "blahblah")
        click_button "Create User"

        # verifications for the test
        # TODO the following line will not make a test case
        page.has_text?('Form is invalid')
        #expect {User.count}.to change { count }.by(1)
      end.should_not change(User, :count)
    end
  end

  describe "successful login" do
    it "should allow a valid user to login" do
      lambda do 
        visit "/login"
        fill_in('user_email', :with => @user[:email])
        fill_in('user_password', :with => @user[:password])
        click_button "Log in"
        #page.has_text?('User Stories')
      end.should has_text('Logged in as') 
    end
  end    

  describe "create story" do
    before(:each) do
      visit "/login"
      fill_in('email', :with => @user[:email])
      fill_in('password', :with => @user[:password])
      click_button "Log in"
    end


    describe "create new story" do
      it "should create a new story with only valid text fields" do
        lambda do
        save_and_open_page
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
 
=begin

   describe "edit one field immediately after creating a story   " do
   end

   describe "edit a single story, having accessed the story from the All Stories list   " do
   end

   describe "edit multiple, get to page  " do
   end

   describe "edit multiple, change one field  " do
   end

   describe "click on a tag, view    " do
   end

   describe "tagged subset, edit multiple, view   " do
   end

   describe "tagged subset, edit multiple, edit   " do
   end

   describe "destroy story" do
   end

=end
