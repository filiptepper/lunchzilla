# encoding: utf-8

class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(
      github_id: auth_hash['extra']['raw_info']['id'],
      username:  auth_hash['extra']['raw_info']['login'],
      email:     auth_hash['extra']['raw_info']['email']
    )
    self.current_user = user

    redirect_to orders_path, notice: "Bon appétit, #{current_user.username}!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Hope you had a good time!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end