class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_github_id_and_username_and_email(
      auth_hash["extra"]["raw_info"]["id"],
      auth_hash["extra"]["raw_info"]["login"],
      auth_hash["extra"]["raw_info"]["email"]
    )
    self.current_user = user
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end