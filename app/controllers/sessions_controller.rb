class SessionsController < ApplicationController
def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  admin=Admin.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to user, :notice => "Logged in like a user!"
  elsif admin
    if admin.is_Super?
       session[:admin_id] = admin.id
       redirect_to admins_url, :notice => "Logged in like a Super admin!"
    else  
       session[:admin_id] = admin.id
       redirect_to users_url, :notice => "Logged in like a Just admin!"
    end

  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  session[:admin_id] = nil
  session[:just_admin_id]=nil
  session[:super_admin_id]=nil
  redirect_to root_url, :notice => "Logged out!"
end
end
