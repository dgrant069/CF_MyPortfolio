require "test_helper"

feature "Delete a post" do
  scenario "Visitor: I can't see delete link" do

    #Given that I'm a vistor

    #When I visit index
    visit posts_path

    #Then I won't see New Post link
    page.wont_have_link "Destroy"

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
