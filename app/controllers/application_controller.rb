class ApplicationController < ActionController::Base
  def logged_user
    User.first
  end
end
