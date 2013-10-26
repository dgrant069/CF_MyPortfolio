require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do

  scenario "Visitor: I can't edit a project" do

    # Given I'm not signed in

    # When I visit project index
    visit projects_path

    # Then the project is successfully created and is visible
    page.wont_have_content "Edit"
  end

  scenario "Author: I can't edit project" do

    # Given I'm an Author
    login

    # When I visit project index
    visit projects_path

    # Then the project is successfully created and is visible
    page.wont_have_content "Edit"
  end



  scenario "eEditor: I can edit an existing project" do
    # Given an existing project
    login_editor
    visit edit_project_path(projects(:proj_uno))

    # When I make changes
    fill_in "Name", with: "My Rad Portfolio"
    click_on 'Update Project'

    # Then the changes should be saved and shown
    page.text.must_include "Success"
    page.text.must_include "Rad Portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    # Given an existing project
    login_editor
    visit edit_project_path(projects(:proj_uno))

    # When I submit invalid changes
    fill_in "Name", with: "No"
    click_on 'Update Project'

    # Then the changes should not be saved, and I should get to try again
    page.must_have_content "error prohibited this project from being saved"
    page.must_have_content "Name is too short"
  end
end
