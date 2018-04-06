class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    # rest_link = request.base_url+"/reset-password/"+params["employee"]["reset_token"]+"/"+params["employee"]["email"]
    # params["employee"]["reset_link"] = rest_link
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit_password
    @employee = Employee.find_by(:email=>params[:email])
  end

  def send_reset_email
    @employee = Employee.find_by(:email=>params[:email])
    rest_link = request.base_url+edit_password_path(:email=> @employee.email,:reset=>@employee.reset_token)
    if UserMailer.reset_email(@employee,rest_link).deliver
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Email sent' }
      end
    else
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Please try agin' }
      end
    end  
  end

  # def update_password
  #   respond_to do |format|
  #     if @employee.update(:password=>params[:password])
  #       format.html { redirect_to @employee, notice: 'password was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @employee }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @employee.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      if params[:email].present?
        @employee = Employee.find_by(:email=>params[:email])
      elsif params[:id].present?
        @employee = Employee.find(params[:id])
      end
    end

    def employee_params
      params.require(:employee).permit(:name, :age, :email, :password, :gender, :reset_token, :reset_link)
    end
end
