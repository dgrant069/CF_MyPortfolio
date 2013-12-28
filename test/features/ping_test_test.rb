require "test_helper"

feature "PingTest" do
  scenario "website exists" do
    visit "http://dylangrant.us"
    page.must_have_content "dylangrant.us"
  end
end
