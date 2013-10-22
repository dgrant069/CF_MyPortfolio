require "test_helper"

feature "As a site visitor who already has an account, I want to be able to sign in" do

  scenario "sign in" do

    # Given I have an account and want to sign in
    login
    # When the sign in link is clicked (above method uses click_button "Sign in")

    # Then the session should be destroyed
    page.must_have_content "Sign out"
    page.must_have_content "Signed in as"
  end
end
