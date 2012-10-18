# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# stuff_google_spreadsheet_data_into_database
# set_all_initial_status_to_backlog
    
puts "Seed data goes here."

def stuff_google_spreadsheet_data_into_database
  puts "Stuffing Google goes here."
  tales = [
    ["member of this team", "have a manageable list of portfolio projects", "we can manage our work and get some projects done", "Project #1"],
    ["user", "know a stories status (accepted, rejected, implemented, etc.) and the date the status changed", "TBD", "Feature of Project List Project (#1)"],
    ["(any) user", "know who submitted a story", "TBD", "Feature of Project List Project (#1)"],
    ["user who entered a story", "be able to edit it", "TBD", "Feature of Project List Project (#1)"],
    ["user", "see my submitted ideas in a searchable list", "I can review them", "Feature of Project List Project (#1)"],
    ["user", "see my ideas get a review or feedback", "TBDx I can don't think", "Feature of Project List Project (#1)"],
    ["user", "my ideas to be ranked", "the management can prioritize them", "Feature of Project List Project (#1)"],
    ["user", "be able to comment on stories", "TBD", "Feature of Project List Project (#1)"],
    ["user", "I want to submit ideas with a UI page", "management can rank and sort them  into the right catalogies", "Feature of Project List Project (#1)"],
    ["user", "enter my sense of priority", "TBD", "Feature of Project List Project (#1)"],
    ["user", "enter my stories into the system", "TBD", "Feature of Project List Project (#1)"],
    ["user", "be able to link stories into \"Tasks\" or \"Chapters\"", "I can see how the system comes together", "Feature of Project List Project (#1)"],
    ["user", "be able to search for stories", "TBD", "Feature of Project List Project (#1)"],
    ["super user", "be able to delete stories", "TBD", "Feature of Project List Project (#1)"],
    ["stakeholder", "have input into the relative weights of stories", "I don't get stuck with some small task that turns out to be huge", "Feature of Project List Project (#1)"],
    ["stakeholder", "see the status of stories and tasks", "know that progress is being made", "Feature of Project List Project (#1)"],
    ["owner", "be able to use the relative estimation of story difficulty", "I can get things done in the right order", "Feature of Project List Project (#1)"],
    ["project owner", "have control over priority status", "I know how to schedule a sprint", "Feature of Project List Project (#1)"],
    ["project owner", "control the review status of a story (new, in review, approved, tabled)", "I know when a story is ready for development", "Feature of Project List Project (#1)"],
    ["developer", "claim ownership of a user story", "I don't duplicate someone else's effort", "Feature of Project List Project (#1)"],
    ["developer", "break a user story into bite-sized tasks", "focus on one task at a time", "Feature of Project List Project (#1)"],
    ["ProMatch member with a computer problem", "search a diagnostic database 24/7 for similar hardware/software/wetware problems and find possible solutions including the date, the resulotion or recommendation, the person who had the problem, the person (or persons) who came up with the solution", "I can get my computer working, get back to my job search, and get a job.", "Candidate Project (the one Glenn wants to do)"],
    ["member of this team", "be able to arrange stories in a hierarchy of projects, epic stories (e.g. projects or major releases), stories, sub-stories, tasks, etc.)", "I can keep the big picture and today's focus separate in my mind and not get distracted.", "Feature of Project List Project (#1)"],
    ["user", "be able to arrange stories independent of their hierarchy ", " stories can be grouped into sprints", "Feature of Project List Project (#1)"],
    ["user", "have a memorable name for stories", "I can keep them straight in my head and talk about them", "Feature of Project List Project (#1)"],
    ["co-lead", "create and track action items as user stories and allow all other teams and co-leads to do the same", "by maintaining a master shared to-do list, things don't get dropped", "Candidate Project"],
    ["owner", "be able to write a new user story that is really the consolidation of two or more so that the new story \"replaces\" the old stories but the old stories and their terminology are still available to be searched", "we can clean up the big picture and converge on a shared terminology without losing any old data but not having to wade through it either", "Feature of Project List Project (#1)"],
    ["user or product owner", "see the highest level epic stories in a list", "I can see priorities and get a sense of the roadmap", "Feature of Project List Project (#1)"],
    ["user or product owner", "drill down into stories", "I can see the details of features, development progress, and know what's coming and when", "Feature of Project List Project (#1)"],
    ["product owner", "see low level numbers roll up", "estimation and status at a low level that I trust is reflected at a high level in place of \"gut feeling\" that is notoriously inaccurate", "Feature of Project List Project (#1)"],
    ["ProMatch member", "be able to use a web application to print sign-up sheets for workshops", "I never have to worry about having the right version (Mac or Windows) of the spreadsheet on any computer and so that the stuff around the workshop (e.g. why people should take it and what prerequisites they need can be managed in one place (i.e. on the web application server) ", "Candidate Project"],
    ["ProMatch member", "be able to print name tents from a web application", "a common format can be preserved", "Candidate Project"],
    ["ProMatch member with a computer problem", "use something like https://sites.google.com/site/pmnetworkingopportunities/home to not only find networking opportunities but to build small teams to meet before events, pump each other up, and network as a team", "I never have to do this scary thing alone", "Candidate Project"],
    ["ProMatch member", "use a web application that does what this (http://www.customresumetracking.com/) does to manage resumes", "I can make my job search easier", "Candidate Project"]
  ]
  tales.each {|ns|
    st = Story.new(as_a: ns[0], i_want_to: ns[1], so_that: ns[2], notes: ns[3], status: 'Backlog')
    st.save!
    puts st.inspect
  }
end

stuff_google_spreadsheet_data_into_database
