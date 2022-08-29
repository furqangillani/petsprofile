class PetsController < ApplicationController
  before_action :set_pet, only: [ :show, :edit, :update, :destroy ]
  def index
    @pet = Pet.new
    @pets = current_user.pets
    @types = current_user.types
    @pets = current_user.types.map { |item| item.pets }
  end

  def all_pets
    @pets = current_user.pets(created_at:'desc')
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
    @types =  current_user.types
  end

  def show_pet
    @pet = Pet.find_by(id: params[:id])
    @pet.update!(:status => true)
    redirect_to pets_path
  end

  def hide_pet
    @pet = Pet.find_by(id: params[:id])
    @pet.update!(:status => false)
    redirect_to pets_path
  end


  def create
    @pet = current_user.pets.new(pet_params)

      if @pet.save
        redirect_to pet_path(@pet), notice: "Pet was successfully created."
      else
        render 'new'
      end
    end

  def update
    if @pet.update(pet_params)
        redirect_to pet_path(@pet), notice: "Pet was successfully updated."
      else
        render 'edit'
      end
  end


  def destroy
    @pet.destroy

    redirect_to pets_path, notice: "Pet was successfully destroyed."
  end

  private

    def set_pet
      @pet = current_user.pets.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :breed, :gender, :age, :description, :type_id)
    end
end
