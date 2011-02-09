class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    # @user_session = UserSession.new(params[:user])
    respond_to do |format|
      if @user_session.save
      #flash[:notice] = "Login successful!"
      #redirect_back_or_default users_url

      format.html { redirect_to(:users, :notice => 'Login Successful') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    current_user_session.destroy

    flash[:notice] = "Logout successful!"
    logger.info "The user logged out successfuly ! -- to remove after tests"

    redirect_to new_user_session_url

  end

end

