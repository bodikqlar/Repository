class AdminsController < ApplicationController
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
 
@admin = Admin.find(session[:admin_id])
if not @admin.is_Super?
#if @admin.type=="JustAdmin"
  @users = User.paginate(:page => params[:page],per_page: 2)

#elsif @admin.type=="SuperAdmin"
elsif @admin.is_Super?
  @admins=Admin.all
end
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
end
