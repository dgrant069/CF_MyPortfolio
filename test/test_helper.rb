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
    fill_in author, with: comment(:com_one).author
    fill_in author_url, with: comment(:com_one).author_url
    fill_in author_email, with: comment(:com_one).author_email
    fill_in user_ip, with: comment(:com_one).user_ip
    fill_in user_agent, with: comment(:com_one).user_agent
    fill_in referrer, with: comment(:com_one).referrer
    fill_in content, with: comment(:com_one).content
  end

  def comment_two
    fill_in author, with: comment(:com_two).author
    fill_in author_url, with: comment(:com_two).author_url
    fill_in author_email, with: comment(:com_two).author_email
    fill_in user_ip, with: comment(:com_two).user_ip
    fill_in user_agent, with: comment(:com_two).user_agent
    fill_in referrer, with: comment(:com_two).referrer
    fill_in content, with: comment(:com_two).content
  end
end

Turn.config.format = :outline
