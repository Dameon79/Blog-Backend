require 'rails_helper'

RSpec.describe CommentNotificationMailer, type: :mailer do
  let!(:mail) { 
    article = create(:article, title: "Peter Griffin") 
    CommentNotificationMailer.with(article_id: article.id).comment_notification
  }

  it "renders the headers" do
    expect(mail.subject).to eq("There are new comments to review")
    expect(mail.to).to eq(["dameon@dameon-sumpton.com"])
    expect(mail.from).to eq(["dameon@dameon-sumpton.com"])
  end

  it "renders the body" do
    expect(mail.body.encoded).to match("Article , Peter Griffin has new comments")
  end
end
