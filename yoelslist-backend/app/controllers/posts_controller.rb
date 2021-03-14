class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :new, :update, :destroy]
  def index
    @posts = Post.all
    render json: @posts

    # .search(params[:search])
  end

  def new
    @post = Post.new
    @title = 'Create a new post'
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post 
    # pulls id from /posts/:id in url
  end

  def edit
    @post = Post.find(params[:id])
    if @post.edit
        render json: @post
    end
  end

  # def update
  #   @post = Post.find(params[:id])
  #   if current_user == @post.user && @post.update(post_params)
  #     render :json: @post
  #   else
  #     render :edit
  #   end
  # end

  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
        render json: @post
    end

end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :cost, :body, :pic,:image, :longitude, :latitude, :address, :user_id)
  end
end
