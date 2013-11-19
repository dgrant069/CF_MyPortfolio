require "test_helper"

feature "Can Access Home Page Test" do
  scenario "has content" do
    visit root_path
    page.must_have_content "Wu Wei"
    page.wont_have_content "Sally"
  end
end
