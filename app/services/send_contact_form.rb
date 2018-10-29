class SendContactForm

  def initialize(json_message)
    self.json_message = json_message
  end

  attr_accessor :json_message

  def self.call(json_message)
    new(json_message).call
  end

  def call
    parsed_json = JSON.parse(json_message)
    message = Message.new(parsed_json)

    ContactFormMailer.with(message: message).contact_notification.deliver_now
  end
end