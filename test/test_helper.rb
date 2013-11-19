ENV["RAILS_ENV"] = "test"
require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "capybara/rails"
require "capybara/rspec/matchers"
require "minitest/rails/capybara"
require "minitest/autorun"
require "minitest/focus"
# require "database_cleaner"


class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::RSpecMatchers
  include Capybara::DSL
end

require "minitest/pride"



class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login
    @user = users(:two)
    visit new_user_session_path
    fill_in "Email", with: users(:two).email
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  def login_editor
    @user = users(:one)
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  def comment_one
    fill_in "comment_author", with: comments(:com_one).author
    fill_in "comment_author_url", with: comments(:com_one).author_url
    fill_in "comment_content", with: comments(:com_one).content
  end

  def comment_two
    fill_in "comment_author", with: comments(:com_two).author
    fill_in "comment_author_url", with: comments(:com_two).author_url
    fill_in "comment_content", with: comments(:com_two).content
  end
end

Turn.config.format = :outline
