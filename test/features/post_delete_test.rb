require "test_helper"

feature "PostDelete" do
  scenario "can delete a post" do

    #Given I have a existing post
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', :with => "Brand new"
    fill_in 'Body', :with => "It shines like new"
    click_on 'Create Post'
    click_on 'Back'

    #When I click the delete link
    click_on 'Destroy'

    #Then post is destroyed and no longer seen
    page.wont_have_content "Brand new"
    page.wont_have_content "It shines"


  end
end
