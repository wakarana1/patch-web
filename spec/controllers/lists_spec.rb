require "rails_helper"
require 'shoulda/matchers'

describe ListsController do
  it "should get page for lists" do

	  #simulate a 'get' request on our ListsController
	  #hit the 'index' method
	  get :index

	  #staus code returned should be 200 for success
	  expect(response).to have_http_status(:success)

	  #check that the index view was rendered
	  expect(response).to render_template(:index)
	end
	it "should create a list" do
   ## use HTTP ver 'post, call the 'create' method,
   #  pass a parameter named 'list, use Factory Girl to return a
   #  hash of the attributes of an object, this will pass 'name'
   #  to create, which is the parameter it will expect
   post :create, list: FactoryGirl.attributes_for(:list)
   ## test that the controller redirects to the correct path
   #  in this case we want to go back to where we list out all
   #  the lists
   expect(response).to redirect_to(lists_path)
	end
	#index should return object
  it "should get an object from db" do

    # kick off a get request
    get :index

    # simply test that this controller will assign an
    # @lists object for our view
    assigns(:lists).should_not be_nil
  end
end