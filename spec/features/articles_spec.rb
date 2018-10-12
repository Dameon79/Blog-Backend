require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  describe "Reading an article as a user" do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    let(:article) { create(:article) }

    it "shows the article" do
      visit article_path(article)

      expect(page).to have_content article.title
    end
  end

  describe "Displays the Homepage to a user" do
    it "allows a user to view the Homepage" do
      visit root_url

      expect(page).to have_xpath '//form'
    end
  end
end
