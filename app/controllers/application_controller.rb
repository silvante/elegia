class ApplicationController < ActionController::Base
  include Authentication

  before_action :require_authentication

  private

  def require_authentication
    redirect_to home_path unless authenticated?
  end
end
