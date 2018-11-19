class PagesController < ApplicationController
  def home
  end

  def add_photo
    user= current_user
    user.avatar = params[:user][:avatar]
    user.save
    redirect_back fallback_location: root_path
  end
end


