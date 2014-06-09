class UsersController < ApplicationController
   helper_method :sort_column, :sort_direction

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
    
    #@users = User.order('position ASC').paginate(:page => params[:page],per_page: 4)
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])

end

def sort
  params[:user].each_with_index do |id, index|
     User.update_all({position: index+1}, {id: id})
  end
  render true
end
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "position"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
