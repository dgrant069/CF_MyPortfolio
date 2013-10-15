require "test_helper"

feature "ProjectDelete" do
  scenario "Can delete a project" do

    @only = projects(:proj_uno).id

    #Given I have a existing project
    visit projects_path

    #When I click the delete link
    puts "/projects/#{@only}"
    click_link('Destroy', href: "/projects/#{@only}")

    #Then project is destroyed and no longer seen
    page.wont_have_content projects(:proj_uno).name
  end
end
