class DepartmentsController < ApplicationController
  before_action :set_department, except: [:index, :new, :create]
  #before_action :department_form, only: [:new, :edit]

  def index
    @departments = Department.all
  end

  def show

  end

  def new 
    @department = Department.new 
    render partial: "form"
  end

  def create 
    @department = Department.new(department_params)

    if @department.save
      redirect_to department_path(@department)
    else
      render :new 
    end
  end

  def edit 
    render partial: "form"
  end

  def update
    # Person.update(params[:id]).update(department_params)

    if Department.update(department_params)
      redirect_to department_path(@department)
    else 
      render :edit
    end
  end

  def destroy 
    #Department.find(params[:id]).destroy 
    @department.destroy
    redirect_to departments_path
  end

  private 
  def department_params 
    params.require(:department).permit(:department_name)
  end

  def set_department
    @department = Department.find(params[:id])
  end

  # def department_form
  #   render partial: "form"
  # end
end
