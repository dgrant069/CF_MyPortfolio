require "test_helper"

feature "Can view posts" do
  scenario "Visitor: I can only view published posts" do

    # Given I am not signed in

    # When visit the index
    visit posts_path

    # Then I will see only published blogs
    page.must_have_content "It shines like new"
    #page.wont_have_content

  end

  scenario "Author: I can view published posts as well as my drafts" do

    # Given I am signed in
    login

    # When I visit index
    visit posts_path

    # Then I will see published posts and my drafts
    page.must_have_content posts(:post_brand_new).title
    #page.wont_have_content
    #page.wont_have_content

  end

  scenario "Editor: I can view all stages of posts" do

    # Given I am an editor
#   login_editor

    # When I visit index
#    visit posts_path

    # Then I will see all posts
#    page.must_have_content posts(:post_brand_new).title
#    page.must_have_content posts(:post_different).title

  end
end
