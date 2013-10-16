require "test_helper"

feature "As a site visitor
  I want to be able to sign up for an account
  so that I can perform actions that require me to be logged in." do
  scenario "sign up" do

    # Given a registration form
    visit '/'
    click_on "Sign Up"


    # When user clicks sumbit form data
    fill_in "Email", with: "joe@email.com"
    fill_in "Password", with: "joepw"
    fill_in "Password confirmation", with: "joepw"
    click_on "Sign Up"

    # Then new user is created
    page.must_have_content "success"
    page.must_have_content "Copyright © Dylan Grant 2013"
    page.wont_have_content "joe@email.com"
    page.wont_have_content "joepw"
    page.wont_have_content "There was a problem with your sign up"
  end
end
