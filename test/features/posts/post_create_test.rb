require "test_helper"

feature "Create a post" do
  scenario "When signed in, I can submit form data to create a blog post and am author" do

    #Given that I'm signed in and have complete form data
    login
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:post_brand_new).title
    fill_in 'Body', with: posts(:post_brand_new).body

    #When I submit the form
    click_on 'Create Post'

    #Then a new post is created and can be seen
    page.must_have_content "Post was successfully created."
    page.must_have_content posts(:post_brand_new).title
    assert page.has_css? "#author"
    page.must_have_content "Author: #{users(:one).email}"
  end
end
