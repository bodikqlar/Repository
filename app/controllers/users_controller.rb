class UsersController < ApplicationController
def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end

def edit
  @user = User.find(session[:user_id])
end
def show
  @user = User.find(session[:user_id])
end


 def update
 	
   @person = User.find(session[:user_id])
   if @person.update_attributes(params[:user])
      redirect_to user_url, :notice => "Updated"
   else
      render 'edit'
  end
  end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
   true
  end


end
