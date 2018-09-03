require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  describe "Viewing all articles" do
    let!(:article) { create(:article) }

    it "shows all articles" do
      visit admin_articles_path

      expect(page).to have_content article.title
    end
  end

  describe "creating a new article" do
    it "creates a new blog post" do
      visit new_admin_article_path

      fill_in "article_title", with: "hello"
      fill_in "article_text", with: "test text"
      click_button "Create Article"
      
      expect(page).to have_content  "Article succesfully created"
    end
  end

  describe "ensure article has title and content" do
    let!(:article) { create(:article) }

    it "checks blog title and article is complete" do
      visit new_admin_article_path
      click_button "Create Article"

      expect(page).to have_content "Text can't be blank"
      expect(page).to have_content "Title can't be blank"
    end
  end

  describe "editing an existing article" do
    let!(:article) { create(:article) }

    it "edits a current blog post" do
      visit admin_articles_path

      click_link "Edit"
      fill_in "article_text", with: "new title"
      click_button "Update Article"

      expect(page).to have_content  "new title"
    end
  end

  describe "deleting an existing article", js: true do
    let!(:article) { create(:article) }

    it "should remove the article" do
      visit admin_articles_path
      click_button "Delete"
      page.driver.browser.switch_to.alert.accept 
      
      expect(page).not_to have_content "article_title"
 
    end
  end

end

