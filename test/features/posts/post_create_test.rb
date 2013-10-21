require "test_helper"

feature "Create a post" do
  scenario "Visitor: I can't submit form data to create a blog post" do

    #Given that I'm a vistor
    visit posts_path

    #When I click on New Post
    click_on 'New Post'

    #Then I get an unauthorized message
    page.must_have_content "You are not authorized"
  end

  scenario "Author: When signed in, I can submit form data to create a blog post" do

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

  scenario "Editor: When signed in, I can submit form data to create a blog post and publish it" do

    #Given that I'm signed in and have complete form data
#    login_editor
#    visit posts_path
#    click_on 'New Post'
#    fill_in 'Title', with: posts(:post_brand_new).title
#    fill_in 'Body', with: posts(:post_brand_new).body

    #When I submit the form
#    click_on 'Create Post'

    #Then a new post is created and can be seen
#    page.must_have_content "Post was successfully created."
#    page.must_have_content posts(:post_brand_new).title
#    assert page.has_css? "#author"
#    page.must_have_content "Author: #{users(:one).email}"
  end

end
