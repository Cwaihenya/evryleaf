class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def new
      @tasks = Task.new
    end

def index
  @tasks=Task.all
end
    def create
      @tasks = Task.new(task_params)
      if @tasks.save

        redirect_to tasks_path
        flash[:success] = 'Task Created'
      else
        render 'new'
      end
    end
    def show
   @tasks = Task.find(params[:id])
  end

  def edit
     @tasks = Task.find(params[:id])
  end
  def update
    @tasks = Task.find(params[:id])
    if @tasks.update(task_params)
      redirect_to tasks_path
       flash[:success] = "You have edited this task！"
    else
      render 'edit'
    end
  end
  def destroy
   @task.destroy
   redirect_to tasks_path
   flash[:success] = "You have deleted the task!"
 end

 private

  def task_params
   params.require(:task).permit(:title,:content,:deadline,:status,:priority)
 end

 def set_task
   @task = Task.find(params[:id])
 end

end
