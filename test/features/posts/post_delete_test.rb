require "test_helper"

feature "Delete a post" do
  scenario "Visitor: I can't see delete link" do

    #Given that I'm a vistor

    #When I visit index
    visit posts_path

    #Then I won't see Destroy link
    page.wont_have_content "Destroy"

  end

  scenario "Author: I can delete only my unpublished posts and none others see delete link" do
    @only = posts(:two_unpublished).id

    #Given that I'm an author
    login

    #When I visit index
    visit posts_path

    #Then I can Destroy my unpublished post link, but not others
    click_link('Destroy', href: "/posts/#{@only}")
    page.wont_have_content posts(:two_unpublished).title
    page.wont_have_content "Destroy"
  end

  scenario "Editor: I can delete any users post at any state" do

    @only1 = posts(:one_unpublished).id
    @only2 = posts(:one_published).id
    @only3 = posts(:two_unpublished).id
    @only4 = posts(:two_published).id

    #Given I have a existing post
    login_editor
    visit posts_path

    #When I click the delete link
    #puts "/posts/#{@only}"
    click_link('Destroy', href: "/posts/#{@only1}")
    click_link('Destroy', href: "/posts/#{@only2}")
    click_link('Destroy', href: "/posts/#{@only3}")
    click_link('Destroy', href: "/posts/#{@only4}")

    #Then post is destroyed and no longer seen
    page.wont_have_content posts(:one_unpublished).title
    page.wont_have_content posts(:one_published).title
    page.wont_have_content posts(:two_unpublished).title
    page.wont_have_content posts(:two_published).title

  end
end
