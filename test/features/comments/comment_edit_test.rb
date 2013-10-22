require "test_helper"

feature "PostEdit" do
  scenario "Visitor: I can't submit form data to edit a blog post" do

    #Given that I'm a vistor
    #When I visit index
    visit post_path(:two_published)

    #Then I won't see New Post link
    page.wont_have_link "Edit Comment"

  end

  scenario "Author: When signed in, I can submit edited form data" do

    # Given I have an existing post comment
    login

    #When I visit index
    visit post_path(:two_published)

    #Then the post is updated and changes viewable
    page.wont_have_link "Edit Comment"
  end

  scenario "Editor: When signed in, I can submit form data to edit a blog post and publish" do

    #Given that I'm signed in and have complete form data
    login_editor

    #When I visit index
    visit post_path(:two_published)

    #Then the post is updated and changes viewable
    page.wont_have_link "Edit Comment"
  end

end
