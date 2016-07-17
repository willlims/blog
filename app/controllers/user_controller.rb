class UserController < ApplicationController
  # user_index GET    /user(.:format)                                   user#index
  #                    POST   /user(.:format)                                   user#create
  # new_user GET    /user/new(.:format)                               user#new
  # edit_user GET    /user/:id/edit(.:format)                          user#edit
  # user GET    /user/:id(.:format)                               user#show
  # PATCH  /user/:id(.:format)                               user#update
  # PUT    /user/:id(.:format)                               user#update
  # DELETE /user/:id(.:format)                               user#destroy

  def index
    # @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update

  end

  def destroy

  end

  def login
    @user = User.new
  end

  def login_to
    user = User.find_by(params[:user])
    session[:user_id] = user.id if user
    redirect_to user
  end

end
