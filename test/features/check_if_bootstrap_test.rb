require "test_helper"

feature "CheckIfBootstrap" do
  scenario "bootstrap has been installed" do

    # Given bootstrap theme is installed


    # When I open my home page
    visit root_path

    # Then it will have the bootstrap theme
    page.body.must_include 'col-'

  end
end
