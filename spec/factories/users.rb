FactoryGirl.define do

##GENERAL

	factory :valid_user, class: User do

		name "name"
		email "test@test.com"
		password "password"
		password_confirmation "password"

	end
	
	factory :null_email, class: User do
		
		name "name"
		email ""
		password "password"
		password_confirmation "password"
	
	end	

	factory :email_end, class: User do

		name "name"
		email "test@test"
		password "password"
		password_confirmation "password"

	end

	factory :short_password, class: User do

		name "name"
		email "test@test.com"
		password "123"
		password_confirmation "123"

	end

	factory :no_match_password, class: User do

		name "name"
		email "test@test.com"
		password "password"
		password_confirmation "pass"

	end

end