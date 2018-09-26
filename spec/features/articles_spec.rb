require 'rails_helper'

RSpec.describe "Articles", type: :feature do

  describe "Reading an article as a user" do
    let!(:article) { create(:article) }

    it "shows the article" do
      visit article_path(article)

      expect(page).to have_content article.title
    end

    it "loads disqus", js: true do
      visit article_path(article)
    
      within '#disqus_thread' do
        expect(page).to have_xpath '//iframe'
      end
    end
  end

  describe "Displays the Homepage to a user" do

    it "allows a user to view the Homepage" do
      visit root_url


      expect(page).to have_xpath '//form'
    end
  end
end
