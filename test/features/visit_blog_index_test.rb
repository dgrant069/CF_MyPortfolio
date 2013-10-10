require "test_helper"

feature "VisitBlogIndex" do
  scenario "Can view existing posts" do

    #Given there are existing posts
    Post.create(title: "Now we're blogging", body: "Off to the races on this blog")

    #When visiting /posts
    visit posts_path

    #Then can view posts
    page.must_have_content "Now we're blogging"
    page.must_have_content "Off to the races on this blog"
  end
end
