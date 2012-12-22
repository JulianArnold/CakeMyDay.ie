# UserSessionsController.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Note 1 (see methods below)
#         Certain methods originally based on AuthLogic demonstration code 
#         @ https://github.com/binarylogic/authlogic_example
#
#         and on demonstration code from 
#         @ http://joelgreutman.com/2011/03/13/rails-3-and-authlogic-basic-setup
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class UserSessionsController < ApplicationController

  before_filter :logged_out_required, :only => [:new, :create]
  before_filter :logged_in_required, :only => :destroy

  # See Note 1 above
  def new
    @user_session = UserSession.new
  end
  
  # See Note 1 above
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Welcome back!"
      user = User.find_by_login(@user_session.login)
      if user and (user.user_group.is_a_manager or user.user_group.is_an_admin)
        redirect_back_or_default shopping_carts_url
      else
        redirect_back_or_default my_account_url
      end
    else
      render :action => :new
    end
  end

  # See Note 1 above
  def destroy
    current_user_session.destroy
    flash[:notice] = "You are now logged out!"
    redirect_to root_url
  end
  
end
