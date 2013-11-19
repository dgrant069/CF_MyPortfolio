require "test_helper"

feature "PingTest" do
  scenario "website exists" do
    visit "http://afternoon-retreat-6087.herokuapp.com/"
    page.must_have_content "DYLAN"
  end
end
