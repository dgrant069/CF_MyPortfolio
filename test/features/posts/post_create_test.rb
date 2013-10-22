require "test_helper"

feature "Create a post" do
  scenario "Visitor: I can't view new post link" do

    #Given that I'm a vistor

    #When I visit index
    visit posts_path

    #Then I won't see New Post link
    page.wont_have_link "New Post"

  end

  scenario "Author: When signed in, I can submit form data to create a blog draft" do

    #Given that I'm signed in and have complete form data
    login
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:two_unpublished).title
    fill_in 'Body', with: posts(:two_unpublished).body

    #When I submit the form
    click_on 'Create Post'

    #Then a new post is created and can be seen
    page.must_have_content "Post was successfully created."
    page.must_have_content posts(:two_unpublished).title
    assert page.has_css? "#author"
    page.must_have_content "Author: #{users(:two).email}"
  end

  scenario "Editor: When signed in, I can submit form data to create a blog post and publish it" do

    #Given that I'm signed in and have complete form data
    login_editor
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:one_unpublished).title
    fill_in 'Body', with: posts(:one_unpublished).body

    #When I submit the form
    click_on 'Create Post'

    #Then a new post is created and can be seen
    page.must_have_content "Post was successfully created."
    page.must_have_content posts(:one_unpublished).title
    assert page.has_css? "#author"
    page.must_have_content "Author: #{users(:one).email}"
  end

end
