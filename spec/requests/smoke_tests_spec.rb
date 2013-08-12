require 'spec_helper'
include Capybara::DSL

Capybara.configure do |config| 
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end

#  the puts strings appears at the top of the test results
puts "hello we are testing"
puts Capybara.default_selector
# this is NOT the way to change the default selector
#   but it might be a way to have Capybara search via id
#Capybara.default_selector = id
#puts Capybara.default_selector

describe "SmokeTests" do

  before(:each) do
    @user = {
      :name =>   "Some Won",
      :email =>  "somewon@example.com",
      :password => "foolishbar",
      :password_confirmation => "foolishbar"
    }
  end

  describe "sign up" do
    # this test does not work.  the error message
    # that we are getting is that Capybara cannot
    # find an element called "username"
    # we tried all of the identifiers which we could find
    # in the page source
    it "should create a new user" do
      get "/signup"
      #fill_in "Username", :with => @user[:name]
      # save and open page requires the launchy gem
      #save_and_open_page
      #fill_in('Username', :with => 'Blah blah')
      fill_in('#user_username', :with => 'Blah blah')
      fill_in('Email', :with => @user.email)
      fill_in('Password', :with => @user.password)
      fill_in 'Password confirmation', :with => @user.password_confirmation
      click "Create User"
      response.status.should be(200)
      expect {User.count}.to change { count }.by(1)
    end
  end



=begin
  describe "GET /smoke_tests" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get smoke_tests_index_path
      response.status.should be(200)
    end
  end




  describe "visit links" do
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end

=end
end
