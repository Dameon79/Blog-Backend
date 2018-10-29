class MessagesController < ApplicationController
  
  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      SendContactFormJob.perform_async(Message.new(message_params).to_json)
      redirect_to pages_contact_path, notice: "Your email has been sent, thanks for getting in touch"
    else
      render :new
    end
  end
  
  
  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
