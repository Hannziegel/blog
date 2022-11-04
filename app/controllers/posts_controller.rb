class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    params[:id]
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
