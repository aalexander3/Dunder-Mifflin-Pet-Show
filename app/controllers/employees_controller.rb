class EmployeesController < ApplicationController
  before_action :get_employee, only: [:show]
  before_action :get_some_dogs, only: [:new, :create, :edit, :update]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render :new
      # redirect_to new_employee_path
    end
  end

  private

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :img_url, :office, :dog_id)
  end

  def get_some_dogs
    @dogs = Dog.all
  end

end
