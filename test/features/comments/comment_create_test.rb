require "test_helper"

feature "Comments can be created" do
  scenario "Visitor: Can't add comments" do

    # Given I'm a visitor

    # When I visit a post
    visit post_path(:two_published)

    # Then I can't add a comment
    page.wont_have_link "Add Comment"

  end

  scenario "Author: I can add a comment for moderation" do

    # Given I'm signed in as an Author and visit post
    login
    Visit post_path(:two_published)
    click_button "Add Comment"

    # When I fill out comment data
    comment_one

    # Then I can't add a comment
    page.must_have_content "Comment test 1"
    page.wont_have_content "not authorized"
  end

  scenario "editor: I can add a comment for moderation" do

    # Given I'm signed in as an editor and visit post
    login_editor
    Visit post_path(:two_published)
    click_button "Add Comment"

    # When I fill out comment data
    comment_one

    # Then I can't add a comment
    page.must_have_content "Comment test 1"
    page.wont_have_content "not authorized"
  end
end
