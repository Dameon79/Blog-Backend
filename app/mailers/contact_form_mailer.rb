class ContactFormMailer < ApplicationMailer

  def contact_notification
    @message = params[:message]
    mail(to: 'dameon@dameon-sumpton.com', subject: 'Contact form from')
  end
end