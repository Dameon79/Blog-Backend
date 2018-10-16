require 'rails_helper'

RSpec.describe SendEmailCampaign do
  describe "Sending a mailchimp campaign", type: :request do
    before do
      request = file_fixture('mailchimp_request.json').read
      response = file_fixture('mailchimp_response.json').read
      status_response = file_fixture('mailchimp_status.json').read
      # Mock out gibbon gem with fixture as the response
      stub_request(:post, "https://us19.api.mailchimp.com/3.0/campaigns").
        with(body: request).
        to_return(status: 200, body: response, headers: {})

      stub_request(:post, "https://us19.api.mailchimp.com/3.0/campaigns/37f40cc1dd/actions/send").
        with(body: "null").
        to_return(status: 204)

      stub_request(:get, "https://us19.api.mailchimp.com/3.0/campaigns/37f40cc1dd").
        to_return(status: 200, body: status_response)
    end

    it "should make a request to Mailchimp" do
      # Make call to service class
      response = SendEmailCampaign.call
      # Check response status
      expect(response.body.fetch(:status)).to eq "sent"
    end
  end
end
