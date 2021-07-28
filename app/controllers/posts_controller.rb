class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "desc")
    @post = Post.new
  end
  # 詳細確認
  def show
    @post = Post.find(params[:id])
    @time = (@post.end_time - @post.start_time).to_i
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
