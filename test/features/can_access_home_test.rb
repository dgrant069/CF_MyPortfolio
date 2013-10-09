# require "test_helper"

# describe "home html exists" do
#  it "has student name"
#     visit '/'
#     page.text.must_include.match "Dylan"
# end

require "test_helper"

feature "Can Access Home Page Test" do
  scenario "has content" do
    visit root_path
    page.must_have_content "Hello, This is a home page"
    page.must_have_content "Dylan"
    page.wont_have_content "Sally"
  end
end
