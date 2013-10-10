require "test_helper"

feature "PostEdit" do
  scenario "Can submit edited form data" do

    #Given I have an existing post
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', :with => "Brand new"
    fill_in 'Body', :with => "It shines like new"
    click_on 'Create Post'
    click_on 'Edit'
    fill_in 'Title', :with => "Make changes"
    fill_in 'Body', :with => "Different now"

    #When I click edit and submit form data
    click_on 'Update Post'

    #Then the post is updated and changes viewable
    page.must_have_content "Make changes"
    page.must_have_content "Make changes"

  end
end
