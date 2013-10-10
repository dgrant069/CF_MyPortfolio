require "test_helper"

feature "PostEdit" do
  scenario "Can submit edited form data" do

    #Given I have an existing post
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:post_brand_new).title
    fill_in 'Body', with: posts(:post_brand_new).body
    click_on 'Create Post'
    click_on 'Edit'
    fill_in 'Title', :with => "Make changes"
    fill_in 'Body', :with => "Different stuff"

    #When I click edit and submit form data
    click_on 'Update Post'

    #Then the post is updated and changes viewable
    page.must_have_content "Post was successfully updated."
    page.must_have_content "Make changes"
  end
end
