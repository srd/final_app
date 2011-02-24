require 'spec_helper'

describe HomeController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have the right title" do
      get 'index'
      response.should have_selector("title", :content => "Welcome to ")
      #TODO edit the title accordingly here later
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    #TODO write a test to check the title
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    #TODO write a test to check the title of the page
  end


end
