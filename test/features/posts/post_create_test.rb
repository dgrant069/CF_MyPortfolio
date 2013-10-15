require "test_helper"

feature "PostCreate" do
  scenario "Can submit form data to create a blog post" do

    #Given that I have complete form data
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:post_brand_new).title
    fill_in 'Body', with: posts(:post_brand_new).body

    #When I submit the form
    click_on 'Create Post'

    #Then a new post is created and can be seen
    page.must_have_content "Post was successfully created."
    page.must_have_content posts(:post_brand_new).title
  end
end
