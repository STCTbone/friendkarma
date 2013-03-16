class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery

  before_filter :require_login
  def not_authenticated
      redirect_to login_path, alert: "Please login first."
  end
end
