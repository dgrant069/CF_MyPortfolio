require "test_helper"


feature "PingTest" do
  scenario "website exists" do
    visit "http://"
    fill_in "q", with: "Code Fellows"
    click_on "Google Search"
    page.text.must_include "codefellows.org"
    page.text.must_include "twitter.com/CodeFellowsOrg"
  end
end
