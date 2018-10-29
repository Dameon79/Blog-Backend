require 'rails_helper'

RSpec.describe "Staticpages", type: :feature do

  describe "Displays the About me page to a user" do
    it "allows a user to visit the About me page" do
      visit pages_about_path

      expect(page).to have_content "My name is Dameon Sumpton"
    end
  end

  describe "Prevents an incomplete contact from being submitted" do
    it "checks all form fields are complete" do
      visit pages_contact_path
      click_button "Send"

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end

  describe "submitting a new contact form" do
    before do
      allow(SendContactForm).to receive(:call)
    end

    it "creates a new contact form" do
      visit pages_contact_path
      fill_in "Name", with: "Dameon Sumpton"
      fill_in "Email", with: "dameon@dameon-sumpton.com"
      fill_in "Body", with: "Hello this is a test contact form"
      
      expect {
        click_button "Send"
      }.to change(SendContactFormJob.jobs, :size).by(1)
    end
  end
end