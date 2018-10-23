require 'rails_helper'

RSpec.describe "Comments", type: :feature do
  before do
    page.set_rack_session(userinfo: { "info" => { "name" => "Daemo", "nickname" => "Steve" }})
  end

  describe "Creating a comment" do
    let!(:article) { create(:article) }

    it "creates the comment" do
      visit article_path(article)
      fill_in "comment_body", with: "test text"
      click_button "Post"

      expect(page).to have_content  "1 comment"
    end
  end

  describe "ensure a comment has a name and body" do
    let(:article) { create(:article) }

    it "checks that the name and comment body is complete" do 
      visit article_path(article)
      click_button "Post"

      expect(page).to have_content "Body can't be blank"
    end
  end
end