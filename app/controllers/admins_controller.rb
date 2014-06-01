class AdminsController < ApplicationController
  helper_method :sort_column, :sort_direction
def new
   if current_admin
    if current_admin.type=="SuperAdmin"
   @admin = Admin.new
  else redirect_to root_url, :notice => "You are not authorized like a Super_Admin"
  end
     
  else redirect_to root_url, :notice => "You are not authorized like a Admin"
  end

end

def create
  
  if (params[:admin][:checkbox]=="1")
   @admin = SuperAdmin.new(params[:admin])
  if @admin.save
    redirect_to root_url, :notice => "SuperAdmin Signed up!"
  else
    render "new"
  end
  else 
     @admin = JustAdmin.new(params[:admin])
  if @admin.save
    redirect_to root_url, :notice => "JustAdmin Signed up!"
  else
    render "new"
  end
  end
 
    
end

def index
 #@admins=Admin.order("position ASC").paginate(:page => params[:page],per_page: 4)
@admins = Admin.order(sort_column + " " + sort_direction).paginate(:page => params[:page],per_page: 4)
end


def edit
  @admin = Admin.find(session[:admin_id])
end

def show
  @admin = Admin.find(session[:admin_id])
end


 def update
 	@admin = Admin.find(session[:admin_id])
 	 if @admin.type=="SuperAdmin"
        
      if @admin.update_attributes(params[:super_admin])
        redirect_to admin_url, :notice => "Updated"
      else
        render 'edit'
      end
    elsif @admin.type=="JustAdmin"
        
      if @admin.update_attributes(params[:just_admin])
        redirect_to admin_url, :notice => "Updated"
      else
        render 'edit'
      end
    end
end

def destroy
    @admin=Admin.find(params[:id])
    @admin.destroy
    true
end

def sort
  #binding.pry
  params[:admin].each_with_index do |id, index|
     Admin.update_all({position: index+1}, {id: id})
  end
  render true
end
 private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
