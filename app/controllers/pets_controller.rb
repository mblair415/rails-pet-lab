class PetsController < ApplicationController

  def index
    owner_id = params[:owner_id]
    @owner = Owner.find_by(id: owner_id)
  end

  def show
    @pet = Pet.find_by(id: params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.create(pet_params)

    owner_id = params[:owner_id]
    owner = Owner.find_by(id: owner_id)

    owner.pets << pet
    redirect_to pet_path(pet)
  end

  # TODO: handle save errors and communicate issues to user

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
