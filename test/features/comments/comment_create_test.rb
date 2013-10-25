require "test_helper"

feature "Comments can be created" do
  scenario "Visitor: Can't add comments to posts" do

    # Given I'm a visitor

    # When I visit a post
    visit post_path(posts(:two_published))

    # Then I can't add a comment
    page.wont_have_button "Create Comment"

  end

  scenario "Author: I can add a Post comment for moderation" do

    # Given I'm signed in as an Author and visit post
    login
    visit post_path(posts(:two_published))

    # When I fill out comment data
    comment_one
    click_button "Create Comment"

    # Then I can't add a comment
    page.must_have_content "Comment test 1"
    page.wont_have_content "not authorized"
  end

  scenario "editor: I can add a Post comment for moderation" do

    # Given I'm signed in as an editor and visit post
    login_editor
    visit post_path(posts(:two_published))

    # When I fill out comment data
    comment_one
    click_button "Create Comment"

    # Then I can't add a comment
    page.must_have_content "Comment test 1"
    page.wont_have_content "not authorized"
  end

  scenario "Visitor: Can't add comments to projects" do

    # Given I'm a visitor

    # When I visit a post
    visit project_path(projects(:proj_uno))

    # Then I can't add a comment
    page.wont_have_button "Create Comment"

  end

  scenario "Author: I can add a Project comment for moderation" do

    # Given I'm signed in as an Author and visit post
    login
    visit project_path(projects(:proj_uno))

    # When I fill out comment data
    comment_one
    click_button "Create Comment"

    # Then I can't add a comment
    page.must_have_content "Comment test 1"
    page.wont_have_content "not authorized"
  end

  scenario "editor: I can add a Project comment for moderation" do

    # Given I'm signed in as an editor and visit post
    login_editor
    visit project_path(projects(:proj_uno))

    # When I fill out comment data
    comment_one
    click_button "Create Comment"

    # Then I can't add a comment
    page.must_have_content "Comment test 1"
    page.wont_have_content "not authorized"
  end
end
