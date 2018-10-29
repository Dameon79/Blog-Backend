class SendContactFormJob
  include Sidekiq::Worker

  def perform(message)
    SendContactForm.call(message)
  end
end