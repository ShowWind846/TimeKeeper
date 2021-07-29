class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order(id: "desc").page(params[:page]).per(10)
    @post = Post.new
    @categories = Category.where(user_id: current_user.id)
  end
  # 詳細確認
  def show
    @post = Post.find(params[:id])
    @time = (@post.end_time - @post.start_time).to_i
    @samedayPosts = Post.where(start_day: @post.start_day)
    @sumTime = 0
    @sumMin = 0
  end
  # スタート
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to "/"
  end
  # 編集
  def edit
    @post = Post.find(params[:id])
  end
  # 編集 / ストップ
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/"
  end
  # 削除
  def destroy
    Post.find(params[:id]).destroy
    redirect_to "/"
  end

  private
  def post_params
    params.require(:post).permit(:title, :start_time, :start_day, :end_time, :end_day)
  end
end
