require "test_helper"

feature "As a site visitor
  I want to be able to sign in with twitter
  so that I can perform actions that require me to be logged in." do

  scenario "sign up with twitter" do

    # Given a registration form
    visit "/"
    click_on "Sign in with twitter"

    # When I register with valid info
    click_button "Sign up"

    # Then I should be signed up
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "There was a problem with your sign up"
  end
end
