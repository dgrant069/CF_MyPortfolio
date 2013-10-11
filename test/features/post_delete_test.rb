require "test_helper"

feature "PostDelete" do
  scenario "can delete a post" do

    @only = posts(:post_brand_new).id

    #Given I have a existing post
    visit posts_path

    #When I click the delete link
    puts "/posts/#{@only}"
    click_link('Destroy', href: "/posts/#{@only}")

    #Then post is destroyed and no longer seen
    page.wont_have_content posts(:post_brand_new).title

  end
end
