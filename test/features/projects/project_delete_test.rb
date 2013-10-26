require "test_helper"

feature "ProjectDelete" do

  scenario "Visitor: I can't see delete link" do

    #Given that I'm a vistor

    #When I visit index
    visit projects_path

    #Then I won't see Destroy link
    page.wont_have_content "Destroy"

  end

  scenario "Author: I can't see delete link" do

    #Given that I'm an author
    login

    #When I visit index
    visit projects_path

    #Then I won't see Destroy link
    page.wont_have_content "Destroy"
  end

  scenario "Editor: Can delete a project" do

    @only = projects(:proj_uno).id

    #Given I have a existing project
    login_editor
    visit projects_path

    #When I click the delete link
    click_link('Destroy', href: "/projects/#{@only}")

    #Then project is destroyed and no longer seen
    page.wont_have_content projects(:proj_uno).name
  end
end
