require "test_helper"

feature "Delete a post" do
  scenario "Visitor: I can't see destroy link" do

    #Given that I'm a vistor

    #When I visit index
    visit post_path(:two_published)

    #Then I won't see New Post link
    page.wont_have_link "Destroy Comment"

  end

  scenario "Author: I can't see a destroy link" do

    #@only = posts(:two_unpublished).id

    #Given that I'm a Author
    login

    #When I click on New Post
    visit post_path(:two_published)

    #Then I get an unauthorized message
    page.wont_have_link "Destroy Comment"

  end

  scenario "Editor: I can delete a comment" do

    @tsop = posts(:two_unpublished).id
    @moc = comments(:com_two).id

    #Given I have a existing post
    login_editor
    visit post_path(:two_published)

    #When I click the delete link
    #puts "/posts/#{@only}"
    click_link('Destroy Comment', href: "/posts/#{@tsop}/comments/#{@moc}")

    #Then post is destroyed and no longer seen
    page.wont_have_content comments(:com_two).title

  end
end
