require 'rails_helper'

  describe "adding a new task" do

    it "can add and reorder a task" do
    # always use visit to land on a page
    # here we use the alias of home_page to start
    visit home_path

    # we check that the current path landed on is indeed the home path
    # note...THIS IS SOME RAD SH#$!..we just mimicked a user
    # actually using our site!
    expect(current_path).to eq(home_path)

    # pressing buttons! this will mock a user clicking our link
    click_link "lists"

    # this verifies that after the link is clicked we land on the
    # path that we are expecting
    expect(current_path).to eq(lists_path)

    # now this is just amazing...here were going to fill in our form fields
    # with real data
    fill_in "list_name", with: "Some task name"

    # and now we click the submit button, well..not us...but our computer lackey
    click_button "Create List"

    # this will verify that there is an elemnt with class 'l-name'
    # that has the text we just saved for a name. In other words it will check
    # the newly listed out lists to see if it really got saved, it does this by looking
    # for the list on the actual page...pretty cool stuff
    expect(page).to have_selector(".l-name", text: "Some task name")

    end
  end