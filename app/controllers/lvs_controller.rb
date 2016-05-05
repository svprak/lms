class LvsController < ApplicationController
  before_action :set_leave, only: [:edit, :update, :destroy]
  before_action :set_emp
  def new
    @lv = Lv.new
  end
  def create
    @lv = Lv.new(leave_params)
    @lv.emp_id = @emp.id

    if @lv.save
      redirect_to @emp, notice: 'Leave added'
    else
      render :new
    end
  end
  def edit
    @lv = Lv.find(params[:id])
  end
  def update
		if @lv.update(leave_params)
			redirect_to emp_path(@lv.emp_id), notice: "Leave updated"
		else
			render :edit
		end
  end
  def destroy
		@lv.destroy
		redirect_to emp_path(@lv.emp_id)
  end

  private
    def set_leave
      @lv = Lv.find(params[:id])
    end
    def set_emp
      @emp = Emp.find(params[:emp_id])
    end
    def leave_params
      params.require(:lv).permit(:lv_date, :lv_from, :lv_to, :lv_unit, :lv_type, :lv_reason)
    end
end
