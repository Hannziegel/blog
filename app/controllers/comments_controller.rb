class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment.author = current_user
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    @post = Post.find_by(id: params[:post_id])
    respond_to do |format|
      format.html { redirect_back_or_to user_posts_path(current_user), notice: 'Deleted!' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
