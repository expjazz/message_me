# frozen_string_literal: true

class MessagesController < ApplicationController
  def new; end

  def create
    @message = Message.new(msg_params)
    @message.user = current_user
    if @message.save
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def index
    @messages = current_user.messages
  end

  private

  def msg_params
    params.require(:message).permit(:body)
  end
end
