require "test_helper"

feature "PostDelete" do
  scenario "can delete a post" do

    @only = posts(:post_brand_new).id

    #Given I have a existing post
    visit posts_path

    # click_on 'New Post'
    # fill_in 'Title', with: posts(:post_brand_new).title
    # fill_in 'Body', with: posts(:post_brand_new).body
    # click_on 'Create Post'
    # click_on 'Back'

    #When I click the delete link
    click_on('Destroy', '/posts/#{@only}')

    #Then post is destroyed and no longer seen
    page.wont_have_content posts(:post_brand_new).title

  end
end
