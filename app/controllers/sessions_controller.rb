# encoding: utf-8

class SessionsController < ApplicationController
  def create
    self.current_user = User.find_or_create_by(
      github_id: auth_hash.uid,
      username:  auth_hash.info['nickname'],
      email:     auth_hash.info['email']
    )

    redirect_to orders_path, notice: "Bon appétit, #{current_user.username}!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Hope you had a good time!'
  end

  def failure
    redirect_to root_path, notice: 'Something went wrong. :( Please try again.'
  end


  protected


  def auth_hash
    request.env['omniauth.auth']
  end
end