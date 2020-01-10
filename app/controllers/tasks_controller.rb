class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  
  
  def new
    # @user = User.find(params[:id])
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
  end 
  
  def edit
  end
  
  def update
    if @task.update_attributes(tasks_params)
      flash[:success] = "タスク情報を更新しました。"
      redirect_to tasks_index_url
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "#{@task.task_title}のデータを削除しました。"
    redirect_to tasks_index_url
  end
  
  private
     
  def tasks_params
    params.require(:task).permit(:task_title, :details)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
  
end

# task_title: params[:task_title], details: params[:details]

