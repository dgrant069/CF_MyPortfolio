require "test_helper"

feature "As a site visitor I want to be able to sign out" do

  scenario "sign out" do

  # Given signed in
    login
    page.must_have_content "Signed in successfully"
    page.must_have_content "Sign out"

    # When the sign out link is clicked
    click_on "Sign out"

    # Then the session should be destroyed
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Sign out"
  end
end
