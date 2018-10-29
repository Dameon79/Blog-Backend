require 'rails_helper'

RSpec.describe ContactFormMailer, type: :mailer do
  describe "sends a contact form email" do
    let(:message) { build(:message) }
    let(:mail) { ContactFormMailer.with(message: message).contact_notification }
  

    it "renders the headers" do
      expect(mail.subject).to eq("Contact form from")
      expect(mail.to).to eq(["dameon@dameon-sumpton.com"])
      expect(mail.from).to eq(["dameon@dameon-sumpton.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content(message.body)
    end
  end
end