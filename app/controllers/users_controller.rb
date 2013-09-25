class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    puts "CREATE UUUUUUSSSERRR ***********"
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to RubyAiWeb!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params[:name] = "birthdayparty"
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
