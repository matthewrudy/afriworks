class Admin::UsersController < ApplicationController
  def index
    @provider_users = User.provider_users
  end

  def new
    @user = User.new
  end

  # POST /admin/users/new, :email => "wubblygig@gmail.com"
  def new_or_edit
    if params[:email].present?
      if @user = User.find_by_email(params[:email])
        redirect_to edit_admin_user_path(@user)
        return
      end
    end
    redirect_to new_admin_user_path
    return
  end
  
  def create
    @user = User.new(params[:user])
    @user.provider_id = params[:user][:provider_id]

    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.provider_id = params[:user][:provider_id] # this is all you can change

    if @user.save
      redirect_to admin_users_path
    else
      flash[:error] = "We couldn't make those changes. Please try again."
      render :action => "edit"
    end
  end

end
