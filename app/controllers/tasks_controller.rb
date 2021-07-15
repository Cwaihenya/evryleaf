class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
PER = 5
  def new
      @tasks = Task.new
      #@tasks = Task.all.order(created_at: :desc)
    end

    def index
        @tasks = Task.all
          if params[:sort_expired]
           @tasks = Task.all.order('deadline DESC').page params[:page]
       elsif params[:task_name].present?
         if params[:status].present?
          @tasks = Task.all.title_search(params[:task_name]).status_search(params[:status]).page params[:page]
        else
          @tasks = Task.all.title_search(params[:task_name]).page params[:page]
        end
      elsif params[:status].present?
          @tasks = Task.all.status_search(params[:status]).page params[:page]
      elsif params[:sort_priority]
          @tasks = Task.all.order('priority DESC').page params[:page]
      else
          @tasks = Task.all.order('created_at DESC').page params[:page]
          @tasks = @tasks.order(created_at: :desc).page(params[:page]).per(PER)
        end
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
