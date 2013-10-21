require "test_helper"

feature "PostEdit" do
  scenario "Visitor: I can't submit form data to edit a blog post" do

    #Given that I'm a vistor
    visit posts_path

    #When I click on New Post
    click_on 'New Post'

    #Then I get an unauthorized message
    page.must_have_content "You are not authorized"
  end

  scenario "Author: When signed in, I can submit edited form data" do

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

  scenario "Editor: When signed in, I can submit form data to edit a blog post and publish" do

    #Given that I'm signed in and have complete form data
#    login_editor
#    visit post_path(posts(:post_brand_new))
#    click_on 'Edit'
#    fill_in 'Title', with: posts(:post_different).title
#    fill_in 'Body', with: posts(:post_different).body

    #When I submit the form
#    click_on 'Update Post'

    #Then a new post is created and can be seen
#    page.must_have_content "Post was successfully updated."
#    page.must_have_content posts(:post_different).title
  end

end
