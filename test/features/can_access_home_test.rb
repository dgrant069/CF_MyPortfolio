require "test_helper"

feature "Can Access Home Page Test" do
  scenario "has content" do
    visit root_path
    page.must_have_content "dylangrant.us"
    page.wont_have_content "Sally"
  end
end
