require "test_helper"

feature "As a site visitor
  I want to be able to sign in with twitter
  so that I can perform actions that require me to be logged in." do

  scenario "sign in with twitter works" do
    visit projects_path
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                             uid: '12345',
                             info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    page.must_have_content "test_twitter_user, you are signed in!"
  end
end
