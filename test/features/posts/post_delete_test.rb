require "test_helper"

feature "Delete a post" do
  scenario "Visitor: I can't delete a post" do

    @only = posts(:post_brand_new).id

    #Given that I'm a vistor
    visit posts_path

    #When I click on New Post
    click_link('Destroy', href: "/posts/#{@only}")

    #Then I get an unauthorized message
    page.must_have_content "You are not authorized"
    page.must_have_content posts(:post_brand_new).title

  end

  scenario "Author: I can't delete a post" do

    @only = posts(:post_brand_new).id

    #Given that I'm a Author
    login

    #When I click on New Post
    visit posts_path
    click_link('Destroy', href: "/posts/#{@only}")

    #Then I get an unauthorized message
    page.must_have_content "You are not authorized"
    page.must_have_content posts(:post_brand_new).title

  end

  scenario "Editor: I can delete a post" do

    @only = posts(:post_brand_new).id

    #Given I have a existing post
    login_editor
    visit posts_path

    #When I click the delete link
    #puts "/posts/#{@only}"
    click_link('Destroy', href: "/posts/#{@only}")

    #Then post is destroyed and no longer seen
    page.wont_have_content posts(:post_brand_new).title

  end
end
