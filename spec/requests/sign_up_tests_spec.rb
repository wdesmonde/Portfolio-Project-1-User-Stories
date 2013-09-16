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
end
