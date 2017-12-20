class PostsController < ApplicationController
  before_action :authorize

  def index
    @posts = Post.all.reverse
  end

  def show # /posts/show/1 => 1번글만 보여준다.
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    Post.create(
      user_id: current_user.id,
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def destroy
    # :id를 통해 post 찾는다
    # 그걸 지운다
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # id를 통해 post 찾는다.
    # 그걸 업데이트해준다.
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def add_comment
    Comment.create(
      user_id: current_user.id,
      comment: params[:content],
      post_id: params[:id]
    )
    redirect_to :back
  end
end
