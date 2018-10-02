class SendEmailCampaign 
  def initialize
    self.list_id = ENV.fetch('MAIL_CHIMP_LIST_ID')
    self.template_id = ENV.fetch('MAIL_CHIMP_TEMPLATE_ID')
    self.gibbon = Gibbon::Request.new(symbolize_keys: true)
  end

  attr_accessor :template_id, :list_id, :gibbon

  def self.call
    new.call
  end

  def call 
    begin
      campaign = gibbon.campaigns.create(body: body)
      campaign_id = campaign.body.fetch(:id)
      gibbon.campaigns(campaign_id).actions.send.create
      gibbon.campaigns(campaign_id).retrieve
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end
  end


private

  def body
    {
      type: "regular",
      recipients: recipients,
      settings: settings
    }
  end

  def recipients
    {
      list_id:list_id
    }
  end

  def settings 
    {
      subject_line: "DS Blog Latest Articles",
      template_id: 14067,
      from_name: "DS Blog",
      reply_to: "dsumpton@hotmail.co.uk"
    }
  end
end

