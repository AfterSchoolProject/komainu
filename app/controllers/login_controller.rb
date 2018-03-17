class LoginController < ApplicationController
  def index
  end

  def create
    authenticated = User.authenticate(
      email: create_params[:email],
      password: create_params[:password]
    )
    if authenticated
      redirect_to garage_index_path
    else
      redirect_to root_path
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
