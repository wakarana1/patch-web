require 'rails_helper'

RSpec.describe "Login", :type => :feature do
  describe "loggin a user in" do
    it "logs in a user and redirects to users path" do
      FactoryGirl.create(:valid_user_integration)

      visit new_session_path
      fill_in "Email", with: "integration@integration.com"
      fill_in "Password", with: "password"
      click_on "Login"
      expect(current_path).to eq(users_path)
    end
  end
end