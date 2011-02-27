class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user

  def new
    render
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been mailed to you. Please check your email."
      redirect_to root_url
    else
      flash[:notice] = "Please check that you have enetered valid email address"
      render :action => :new
    end
  end

  def edit
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = paras[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password updated successfully!"
      redirect_to users_url
    else
      render :action => :edit
    end
  end

  private
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        flash[:notice] = "We're sorry, but unalbe to located tour account." + 
          "If you are havgin issues, ty copying and pasting the URL". +
          "from your email or repeat the reset password process."
        redirect_to root_url
      end
    end
end
