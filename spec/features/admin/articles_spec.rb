require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  include BasicAuthHelper
  
  before(:each) do
    log_in
  end

  describe "Viewing all articles" do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    let!(:article) { create(:article) }

    it "shows all articles" do
      visit admin_articles_path

      expect(page).to have_content article.title
    end
  end

  describe "creating a new article" do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    it "creates a new blog post" do
      visit new_admin_article_path

      fill_in "article_title", with: "hello"
      fill_in "article_text", with: "test text"
      click_button "Create Article"
      
      expect(page).to have_content  "Article succesfully created"
    end
  end

  describe "ensure article has title and content" do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    it "checks blog title and article is complete" do
      visit new_admin_article_path
      click_button "Create Article"

      expect(page).to have_content "Text can't be blank"
      expect(page).to have_content "Title can't be blank"
    end
  end

  describe "editing an existing article" do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    let!(:article) { create(:article) }

    it "edits a current blog post" do
      visit admin_articles_path

      click_link "Edit"
      fill_in "article_title", with: "new title"
      click_button "Update Article"

      expect(page).to have_content  "new title"
    end
  end

  describe "deleting an existing article", js: true do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    let!(:article) { create(:article) }

    it "should remove the article" do
      visit admin_articles_path
      click_button "Delete"
      page.driver.browser.switch_to.alert.accept 
      
      expect(page).not_to have_content "article_title"
    end
  end
end

