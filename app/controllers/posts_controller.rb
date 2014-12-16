class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy, :edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
    if !@post
      redirect_to post_path(params[:id]), notice: "You can't edit that!"
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      @post.destroy
      redirect_to root_path, notice: "Post deleted!"
    else
      redirect_to root_path, notice: "You can't delete that!"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end
