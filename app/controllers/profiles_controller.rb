class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :show, :edit, :update, :destroy ]
  before_action :ensure_current_user
  def index
    @profiles = Profile.all
  end

  def show
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
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name)
    end
end
