class TasklistsController < ApplicationController

  before_filter :require_user, :only => [:create, :edit, :update]
  before_filter :set_current_user
  
  respond_to :html, :xml, :json

  layout :choose_layout

  def index
    @search = Tasklist.search(params[:search])
    @tasklists = @search.all.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasklists }
      #format.pdf do
      #  @example_text = "some text"
      #            render :pdf => "tasklists",
      #                   :template => 'tasklists/index.pdf.erb',
      #                   :layout => 'pdf',
      #                   :footer => {
      #                      :center => "Center",
      #                      :left => "Left",
      #                      :right => "Right"
      #                   }
      #end
    end
  end

  def comment
    Tasklist.find(params[:id]).comments.create(params[:comment])
    flash[:notice] = "Added your comment"
    redirect_to :action => "show", :id => params[:id]
  end
  
  def show
    @tasklist = Tasklist.find(params[:id])
    @comment = @tasklist.comments.build
    respond_with(@comment)

  end
  
  def new
    @tasklist = Tasklist.new
    @projects = Project.all
    @users = User.all
  end
  
  def create
    @users = User.all
    @projects = Project.all
    @tasklist = Tasklist.new(params[:tasklist])

    respond_to do |format|
      if @tasklist.save
        format.html { redirect_to(@tasklist, :notice => 'Successfully created task.') }
        format.xml  { render :xml => @tasklist, :status => :created, :location => @tasklist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tasklist.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @users = User.all
    @tasklist = Tasklist.find(params[:id])
  end
  
  def update
    @users = User.all
    @projects = Project.all
    @tasklist = Tasklist.find(params[:id])
    #Tasklist.user_id = current_user.id
    if @tasklist.update_attributes(params[:tasklist])
      flash[:notice] = "Successfully updated task."
      redirect_to @tasklist
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to tasklists_url
  end

  private

  def choose_layout
    if [ 'new', 'edit' ].include? action_name
      'accruals'
    else
      'accruals'
    end
  end

end
