class UsersController < ApplicationController
  
  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def create
  @user = User.new(params[:user])

  respond_to do |format|
    if @user.save
      format.html { redirect_to(:users, :notice => 'Registration successfull.') } #     redirect_to user_path(current_user)
      format.xml  { render :xml => @user, :status => :created, :location => @user }
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
    end
  end

  def show
    @user = current_user
    @roles = current_user.roles.find(:all)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      format.html { redirect_to(:root, :notice => 'User account updated!') }
    else
      format.html { render :action => "edit" }
    end
  end 

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_path
    end
  end

end