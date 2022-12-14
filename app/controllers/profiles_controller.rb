class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :show, :edit, :update, :destroy ]
  def index
    @post = current_user.posts
  end

  def show
    @service = current_user.services
  end

  def new
    @profile = Profile.new
  end

  def edit

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
      if @profile.save
        redirect_to profile_path(@profile), notice: "Profile was successfully created."
      else
        render 'new'
      end
  end

  def update
      if @profile.update(profile_params)
        redirect_to profile_path(@profile), notice: "Profile was successfully updated."
      else
        render 'edit'
      end
    end

  def destroy
    @profile.destroy
      redirect_to profiles_path, notice: "Profile was successfully destroyed."
  end

  private
    def set_profile
      @profile = current_user.profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bio)
    end
end
