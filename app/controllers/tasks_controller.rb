class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to task_url(@task), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to task_url(@task), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    if @task.destroy
      redirect_to tasks_url, notice: "Task was successfully destroyed."
    else
      redirect_to tasks_url, notice: "Task was not successfully destroyed."
    end
  end

  private
    def set_task
      @task = Task.find_by(id: params[:id])
      unless @task
        redirect_to tasks_url, notice: "Task not found."
      end
    end

    def task_params
      params.require(:task).permit(:title, :body, :user_id)
    end
end
