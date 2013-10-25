require "test_helper"

feature "PostEdit" do
  scenario "Visitor: I can't edit a post comment" do

    #Given that I'm a vistor
    #When I visit index
    visit post_path(posts(:two_published))

    #Then I won't see New Post link
    page.wont_have_link "Edit Comment"

  end

  scenario "Author: When signed in, I can't edit a post comment" do

    # Given I have an existing post comment
    login

    #When I visit post
    visit post_path(posts(:two_published))

    #Then the post is updated and changes viewable
    page.wont_have_link "Edit Comment"
  end

  scenario "Editor: When signed in, I can't edit a post comment" do

    #Given that I'm signed in and have complete form data
    login_editor

    #When I visit post
    visit post_path(posts(:two_published))

    #Then the post is updated and changes viewable
    page.wont_have_link "Edit Comment"
  end

  scenario "Visitor: I can't submit form data to edit a project comment" do

    #Given that I'm a vistor
    #When I visit index
    visit project_path(projects(:proj_uno))

    #Then I won't see New Post link
    page.wont_have_link "Edit Comment"

  end

  scenario "Author: When signed in, I can't edit a project comment" do

    # Given I have an existing post comment
    login

    #When I visit post
    visit project_path(projects(:proj_uno))

    #Then the post is updated and changes viewable
    page.wont_have_link "Edit Comment"
  end

  scenario "Editor: When signed in, I I can't edit a project comment" do

    #Given that I'm signed in and have complete form data
    login_editor

    #When I visit post
    visit project_path(projects(:proj_uno))

    #Then the post is updated and changes viewable
    page.wont_have_link "Edit Comment"
  end

end
