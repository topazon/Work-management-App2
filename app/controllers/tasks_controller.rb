class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  
  def index
    @tasks = Task.all.order(created_at: :desc)
  end
  
  def show
    @task = Task.find(params[:id])
  end 
end
