require "test_helper"

feature "Delete a post" do
  scenario "Visitor: I can't see destroy link" do

    #Given that I'm a vistor

    #When I visit index
    visit post_path(posts(:two_published))

    #Then I won't see New Post link
    page.wont_have_link "Destroy Comment"
  end

  scenario "Author: I can't see a destroy link" do

    #@only = posts(:two_unpublished).id

    #Given that I'm a Author
    login

    #When I click on New Post
    visit post_path(posts(:two_published))
    comment_one
    click_button "Create Comment"

    #Then I get an unauthorized message
    page.wont_have_link "Destroy Comment"
  end
end
