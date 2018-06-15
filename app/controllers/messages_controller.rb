class MessagesController < ApplicationController
  def index
    messages = Message.order(id: :desc)

    render json: { body: messages }
  end

  def show
    message = Message.find_by(params[:id])

    render json: { body: message }
  end

  def create
    message = Message.new(allow_params)

    if message.save
      success = 1
      errors = []
    else
      success = 0
      errors = message.errors.full_messages
    end

    render json: { success: success, body: message }
  end

  def update
    message = Message.find_by(params[:id])

    if message.update(allow_params)
      success = 1
      errors = []
    else
      success = 0
      errors = message.errors.full_messages
    end

    render json: { success: success, body: message }
  end

  def delete
    message = Message.find_by(params[:id])

    if message.delete
      success = 1
      errors = []
    else
      success = 0
      errors = message.errors.full_messages
    end

    render json: { success: success, body: message }
  end

  private

    def allow_params
      params.require(:message).permit(:title, :text)
    end
end
