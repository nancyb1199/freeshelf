class UsersController < ApplicationController
def new
end

def create
  @user = User.new(user_params)
  @user.save
  redirect_to books_path
end

private
  def user_params
    params.require(:user).permit(:name, :userid, :password, :password_confirmation)
  end

end
