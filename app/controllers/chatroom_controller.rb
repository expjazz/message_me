# frozen_string_literal: true

class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all
    @message = Message.new
  end
end
