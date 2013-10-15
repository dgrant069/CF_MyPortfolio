require "test_helper"


feature "As a site owner I want to add a portfolio item" do

  scenario "submitting valid form info creates a project" do

    # Given I have a completed project form
    visit projects_path
    click_on 'New project'
    fill_in 'Name', with: projects(:proj_uno).name
    fill_in 'Tech used', with: projects(:proj_uno).tech_used

    # When I submit the project form
    click_on 'Create Project'

    # Then the project is successfully created and is visible
    page.must_have_content "Project was successfully created."
    page.must_have_content projects(:proj_uno).name
  end

  scenario "Create form has invalid data" do

    # Given invalid project data is entered in a form
    visit new_project_path
    fill_in 'Name', with: "Q"

    # When the form is submitted with a short name and missing technologies_used field
    click_on 'Create Project'

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.must_have_content "Project could not be saved"
    page.must_have_content "Name is too short"
    page.must_have_content "Tech used is missing"
  end
end
