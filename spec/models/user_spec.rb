require 'rails_helper'

RSpec.describe User, :type => :model do

	context "email" do

		it "must be present" do
			expect(FactoryGirl.build(:null_email).save).to be false
		end

		it "must be valid" do
			expect(FactoryGirl.build(:valid_user).save).to be true
		end

		it "must end with a .com or other" do
			expect(FactoryGirl.build(:email_end).save).to be false
		end

		it "must be unique" do
			expect(FactoryGirl.build(:valid_user).save).to be true
			expect(FactoryGirl.build(:valid_user).save).to be false	
		end	


	end

	context "password" do

		it "must be 4 > 10 characters" do
			expect(FactoryGirl.build(:short_password).save).to be false
		end

		it "must equal password_confirmation" do
			expect(FactoryGirl.build(:no_match_password).save).to be false
		end

	end
		
end