class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
   @tasks = Task.all
  end

  def show
  # @id = params[:id]
   @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
  @task = Task.create(task_params)
  redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(task_params)
    redirect_to task_path(@task)
  end

private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
