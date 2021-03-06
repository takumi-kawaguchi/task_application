class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: "you add a task successfully"
    else
      render "new"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :description,
                                 :priority,
                                 :status,
                                 :finish_at)
  end
end
