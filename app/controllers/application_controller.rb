class ApplicationController < ActionController::Base
  def logged_user
    User.find(params[:user_id])
  end
end
