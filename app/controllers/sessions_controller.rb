# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      redirect_to root_path
      session[:user_id] = user.id
      flash[:notice] = 'Log in was a succes'
    else
      render 'new'
      flash.now[:alert] = 'Something went wrong. Try again.'
    end
  end
end
