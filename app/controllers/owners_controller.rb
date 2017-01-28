class OwnersController < ApplicationController

  before_filter :authorize

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.new(owner_params)
    if owner.save
      session[:owner_id] = owner.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end

  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    # stretch
  end

  def update
    # stretch
  end

  def destroy
    # stretch
  end

  # TODO: add custom appointments action for convenience

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end

end
