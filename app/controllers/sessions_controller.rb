class SessionsController < Devise::SessionsController

  def new
    get_pre_login_url(request.referer)
    super
  end

  def create
    @@referer_url
    super
  end

private

  def get_pre_login_url(url)
    @@referer_url = url
  end

  def after_sign_in_path_for(resource)
    # @@referer_url
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if @@referer_url == sign_in_url
      super
    else
      stored_location_for(resource) || @@referer_url || root_path
    end
  end

end
