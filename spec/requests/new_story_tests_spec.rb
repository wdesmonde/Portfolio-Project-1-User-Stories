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
    @new_story1 = {
      :tags => "test1",
      :as_a => "user",
      :i_want_to => "new story 1",
      :so_that => "I can say so that",
      :notes => "a = 440"
    }
    @new_story2 = {
      :tags => "test2",
      :as_a => "user",
      :i_want_to => "new story 2",
      :so_that => "I can feed my purrfections",
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

    describe "create new story:  no tag" do
      it "should create a new story without tags" do
        lambda do
          first(:link, "New Story").click
          fill_in('story_as_a', :with => @new_story[:as_a])
          fill_in('story_i_want_to', :with => "story 2")
          fill_in('story_so_that', :with => @new_story[:so_that])
          fill_in('story_notes', :with => @new_story[:notes])
          click_button "Create Story"
        end.should change(Story, :count)
       end # goes with the it should create
    end # goes with describe create new story

  end  # end describe create story

  describe "fail to create story" do
    describe "fail create story:  no as a" do
      it "should fail to create a new story: no as a" do
        lambda do
          first(:link, "New Story").click
            fill_in('story_i_want_to', :with => "story 2")
            fill_in('story_so_that', :with => @new_story[:so_that])
            fill_in('story_notes', :with => @new_story[:notes])
            click_button "Create Story"
        end.should_not change(Story, :count)
      end  # goes with it line
    end  # goes with fail create as a
  end # end describe fail to create story

  describe "immediately after creating a story, edit it" do
    it "should allow editing a brand new story"  do
      lambda do
        first(:link, "New Story").click
        fill_in('story_as_a', :with => @new_story[:as_a])
        fill_in('story_i_want_to', :with => "add a tag")
        fill_in('story_so_that', :with => @new_story[:so_that])
        fill_in('story_notes', :with => @new_story[:notes])
        click_button "Create Story"
        first(:link, "Edit").click
        fill_in('story_tag_list', :with => "tag2")
        click_button "Update Story"
        #save_and_open_page
      end.should change(Tag, :count)
    end # goes with the it should create
  end # goes with describe immed after create, edit

  describe "editing tests" do

    before(:each) do
    #   create a story or two
      first(:link, "New Story").click
      fill_in('story_as_a', :with => @new_story1[:as_a])
      fill_in('story_i_want_to', :with => @new_story1[:tags])
      fill_in('story_so_that', :with => @new_story1[:so_that])
      fill_in('story_notes', :with => @new_story1[:notes])
      click_button "Create Story"
    end

    
    describe "edit a story" do
      it "should allow editing a story" do
        @new_note = "a new note for this test case"
        # go to all stories
        first(:link, 'Back to All Stories').click       
        # find a story to edit
        first(:link, @new_story1[:so_that]).click 
        #  click on the edit button
        first(:link, "Edit").click
        #  enter something in a field
        fill_in('story_notes', :with => @new_note) 
        #  click update story
        click_button "Update Story"
        #  show the story
        #   we should be a show story at this point
        #  verify:  end statment that the field we changed is changed
        expect(page).to have_content(@new_note)
      end   # it statment
     end   # edit a story

   end  # describe edit a story
 
  # describe "select multiple to edit"
  #   verify that we get to the multiedit page

  # describe "multiedit:  change one field"

  # describe "click on a tag and view"

  # describe "within a tag subset select several to multiedit page"

  # describe "within a tag subset edit multiple, change one field"

  # describe "destroy a story"


  # describe "

end  # end describe smoke tests
 
