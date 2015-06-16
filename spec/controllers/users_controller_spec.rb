require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	
	it "should return index view for index method" do
   get :index
   expect(response).to render_template(:index)
	end

	it "new creates a new user" do
   get :new
  	expect(assigns(:user)).to be_a_new(User)
	end
end
