class CommentsController < ApplicationController
  before_action :authenticate_user
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(body: params[:comment][:body])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      render :new
    end
  end
end
