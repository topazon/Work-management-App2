class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def index
    @tasks = Task.all.order(created_at: :desc)
  end
  
  def create
    @task = Task.new(tasks_params)
    @task.user_id = @current_user.id
    
    
    if @task.save
      flash[:success] = "タスク情報を投稿しました。"
      redirect_to tasks_url
    else
      render :new
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end 
  
  
  private
  
     
  def tasks_params
    params.require(:task).permit(:task_title, :details, :user_id)
  end
end
