require "test_helper"

feature "Delete a post" do
  scenario "Visitor: I can't see delete link" do

    #Given that I'm a vistor

    #When I visit index
    visit posts_path

    #Then I won't see New Post link
    page.wont_have_link "Destroy"

  end

  scenario "Author: I can't see a destroy link for published post" do

    @only = posts(:two_unpublished).id

    #Given that I'm a Author
    login

    #When I click on New Post
    visit posts_path

    #Then I get an unauthorized message
    page.wont_have_link('Destroy', href: "/posts/#{@only}")

  end

  scenario "Editor: I can delete a post" do

    @only = posts(:two_unpublished).id

    #Given I have a existing post
    login_editor
    visit posts_path

    #When I click the delete link
    #puts "/posts/#{@only}"
    click_link('Destroy', href: "/posts/#{@only}")

    #Then post is destroyed and no longer seen
    page.wont_have_content posts(:two_unpublished).title

  end
end
