class ApplicationController < ActionController::Base
  unless authenticated?
    redirect_to home_path
  end
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
