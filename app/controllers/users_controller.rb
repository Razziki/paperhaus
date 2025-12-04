class UsersController < ApplicationController
  def new
    @user = User.new
    @provinces = Province.order(:name)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created!"
    else
      @provinces = Province.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  # SHOW PROFILE)
  def show
    @user = User.find(params[:id])
    redirect_to root_path unless current_user&.id == @user.id
  end

  # EDIT PROFILE
  def edit
    @user = current_user
    @provinces = Province.order(:name)
  end

  # UPDATE PROFILE
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      @provinces = Province.order(:name)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address_line1,
      :city,
      :postal_code,
      :province_id
    )
  end
end
