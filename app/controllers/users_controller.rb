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

def index
    
    @users = User.order('position ASC').paginate(:page => params[:page],per_page: 4)
end

def sort
  params[:user].each_with_index do |id, index|
     User.update_all({position: index+1}, {id: id})
  end
  render true
end

end
