require "test_helper"

feature "PostEdit" do
  scenario "Visitor: I can't submit form data to edit a blog post" do

    #Given that I'm a vistor
    #When I visit index
    visit posts_path

    #Then I won't see New Post link
    page.wont_have_link "Edit"

  end

  scenario "Author: When signed in, I can submit edited form data" do

    #Given I have an existing post
    login
    visit post_path(posts(:two_unpublished))
    click_on 'Edit'
    fill_in 'Title', with: "This is an edit"
    fill_in 'Body', with: "EDIT EDIT EDIT"

    #When I click edit and submit form data
    click_on 'Update Post'

    #Then the post is updated and changes viewable
    page.must_have_content "Post was successfully updated."
    page.must_have_content "This is an edit"
  end

  scenario "Editor: When signed in, I can submit form data to edit a blog post and publish" do

    #Given that I'm signed in and have complete form data
    login_editor
    visit post_path(posts(:one_unpublished))
    click_on 'Edit'
    fill_in 'Title', with: "This is an edit"
    fill_in 'Body', with: "EDIT EDIT EDIT"

    #When I submit the form
    click_on 'Update Post'

    #Then a new post is created and can be seen
    page.must_have_content "Post was successfully updated."
    page.must_have_content "This is an edit"
  end

end
