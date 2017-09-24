class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by(userid: params[:userid])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect_to books_path
    else
      render action: 'new'
    end
  end

  def destroy
    reset_session
  end
end
