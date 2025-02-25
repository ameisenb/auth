class TasksController < ApplicationController
  def index
    if session["user_id"] != nil

      @tasks = Task.where({"user_id" => session["user_id"]})
    else

    end
  end

  def create
    if session["user_id"] != nil
    @task = Task.new
    @task["user_id"] = session["user_id"]
    @task["description"] = params["description"]
    @task.save
    redirect_to "/tasks"
    else
      redirect_to "/login"
    end
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"], "user_id" => session["user_id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
