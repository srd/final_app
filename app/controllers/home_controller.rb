class HomeController < ApplicationController
  def index
    @title = "Home"
  end

  def about
    @title = "About Us"
  end

  def contact
    @title = "Contact"
  end

end
