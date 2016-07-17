class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    login = params[:sessions][:login]
    password = params[:sessions][:password]
    #User.find_by_login(login)是新增加的一个类方法，用来实现name或者email的登录
    user = User.find_by(name: login)
    #authenticate是has_secure_password引入的一个方法，用来判断user的密码与页面中传过来的密码是否一致
    # if user && user.authenticate(password)
    if user && user.password.to_s == password
      log_in(user) #SessionsHelper中的方法
      #判断是否要持续性的记住用户的登录状态
      # params[:sessions][:remeber_me] == "1" ? remeber(user) : forget(user)
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid login or password."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #SessionsHelper中的方法
    redirect_to root_path
  end
end
