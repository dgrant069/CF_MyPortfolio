require "test_helper"

feature "PostEdit" do
  scenario "Can submit edited form data" do

    #Given I have an existing post
    login
    visit post_path(posts(:post_brand_new))
    click_on 'Edit'
    fill_in 'Title', with: posts(:post_different).title
    fill_in 'Body', with: posts(:post_different).body

    #When I click edit and submit form data
    click_on 'Update Post'

    #Then the post is updated and changes viewable
    page.must_have_content "Post was successfully updated."
    page.must_have_content posts(:post_different).title
  end
end
