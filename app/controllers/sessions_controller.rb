# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Log in was a succes'
      redirect_to root_path

    else
      flash.now[:error] = 'There was something wrong with your information'
      render 'new'

    end
  end

  def destroy
    session[:user_id] = nil if logged_in?
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to root_path
    end
  end
end
