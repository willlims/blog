class WelcomeController < ApplicationController
  def index
  end

  def show
    @user = User.new
  end

  def create
    p '---------'
    p params
    user = User.find_by(name: params[:name], password: params[:password])
    session[:user_id] = user.id if user
  end

  def logout
    session[:user_id] = nil
  end
end
