require 'spec_helper'

describe "LayoutLinks" do
  it "should have home page at /" do
    get '/'
    response.should have_selector("title", :content => "Home")
  end
  #Similarly write tests for other links like contact and about
  #
  it "should be a sign up page at /signup" do
    get '/signup'
    response.should have_selector("title", :content => "Sign up")
  end

  #checking if the links are proper on the pages or not
  it "should have the rights links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
  end

end
