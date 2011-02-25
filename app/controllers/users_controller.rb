class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  def new
    @title = "Sign up"
    @user = User.new
  end

  def show
    @user = @current_user
  end

  def index
    @title = "Users"
  end

  def edit
    @user = @current_user
  end

  def create
    @user = Users.new(parmas[:user])
    if @user.save
      flash[:notice] = "Successfully registered!"
      redirect_back_or_default users_path
    else
      render :action => :new
    end
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated!"
      redirect_to users_path
    else
      render :action => :edit
    end
  end

end
