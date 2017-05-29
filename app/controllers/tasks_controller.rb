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
      flash[:success] = '新規タスクが生成されました'
      redirect_to @task
    else
      flash.now[:danger] = '新規タスクの生成に失敗しました'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスクの更新に成功しました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'タスクの削除に成功しました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
  
end