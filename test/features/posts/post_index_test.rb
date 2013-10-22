require "test_helper"

feature "Can view posts" do
  scenario "Visitor: I can only view published posts" do

    # Given I am not signed in

    # When visit the index
    visit posts_path

    # Then I will see only published blogs
    page.must_have_content posts(:one_published).title
    page.must_have_content posts(:two_published).title
    page.wont_have_content posts(:two_unpublished).title
    page.wont_have_content posts(:one_unpublished).title
  end

  scenario "Author: I can view published posts as well as my drafts" do

    # Given I am signed in
    login

    # When I visit index
    visit posts_path

    # Then I will see published posts and my drafts
    page.must_have_content posts(:one_published).title
    page.must_have_content posts(:two_published).title
    page.must_have_content posts(:two_unpublished).title
    page.wont_have_content posts(:one_unpublished).title

  end

  scenario "Editor: I can view all stages of posts" do

    # Given I am an editor
    login_editor

    # When I visit index
    visit posts_path

    # Then I will see all posts
    page.must_have_content posts(:one_published).title
    page.must_have_content posts(:two_published).title
    page.must_have_content posts(:two_unpublished).title
    page.must_have_content posts(:one_unpublished).title

  end
end
