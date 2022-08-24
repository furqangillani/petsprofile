class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @all_post = Post.all
    @post = Post.new
    @pets = current_user.pets
    @posts = current_user.pets.map { |item| item.posts }
    @service = current_user.services.limit(3)
    @order = current_user.orders.limit(3)
    @type = current_user.types.limit(3)
    @pet = current_user.pets.limit(3)
  end

  def show
  end

  def new
    @post = Post.new
    @pets = Pet.where(status: true)
  end

  def edit
    @pets = current_user.pets
  end

  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to post_path(@post), notice: "Post was successfully created."
      else
        render 'new'
      end
  end

  def update
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "Post was successfully updated."
      else
        render 'edit'
      end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :pet_id, pictures: [])
    end
end
