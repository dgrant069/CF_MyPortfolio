require "test_helper"


feature "As a site owner I want to add a portfolio item" do

  scenario "submitting valid form info creates a project" do

    # Given I have a completed project form
    visit projects_path
    click_on 'New Project'
    fill_in 'Name', with: projects(:proj_uno).name
    fill_in 'Tech used', with: projects(:proj_uno).tech_used

    # When I submit the project form
    click_on 'Create Project'

    # Then the project is successfully created and is visible
    page.text.must_have "Project was successfully created."
    page.text.must_have projects(:proj_uno).name

  end
end
