class EmpsController < ApplicationController
	before_action :authenticate
	before_action :set_emp, only: [:show, :eidt, :update, :destroy]
  def index
  	@emps = Emp.all#.order("emp_number ASC")
		# @lvs = Lv.where(emp_id: @emp.id).order("created_at DESC")
  	# @emp = Emp.find(params[:id])
		#display_leave(@lvs)
  end
  def show
		@lvs = Lv.where(emp_id: @emp.id).order("created_at DESC")
  	@emp = Emp.find(params[:id])
	#	@lvis = Lv.find(params[:id])
		display_leave(@lvs)
  end
##########################################
  def new
  	@emp = Emp.new
  end
	##################################
  def create
 		@emp = Emp.new(emp_params)
	 	if @emp.save
	 		redirect_to :action => 'index'
	 	else
	 		render :action => 'new'
	 	end
  end
	######################################
  def edit
  	@emp = Emp.find(params[:id])
  end
	########
  def update
		if @emp.update(emp_params)
			redirect_to root_path, notice: "Employee updated"
		else
			render :edit
		end
  end
	######################################
  def destroy
		@emp.destroy
		redirect_to emps_url, notice: "Deleted"
  end
################################################
  private
		def authenticate
			authenticate_user! && current_user.try(:admin?)
		end
		def display_leave(ds)
			@leave_total = 12
			@leave_left = 0
			@aria_value_now = 0
			@i = 0 # For Simple number on the table show
			if ds.blank?
				@leave_taken = 0
			else
				@leave_taken = ds.sum(:lv_unit)
				@leave_left = (@leave_total - @leave_taken)
				@aria_value_now = ((@leave_taken*100)/12).round(2)
			end
		end
  	def set_emp
  		@emp = Emp.find(params[:id])
  	end
  	def emp_params
  		params.require(:emp).permit(:emp_number, :first_name, :last_name, :emp_sex, :department, :position, :hired_date, :contact_info, :address, :image,:ssn, :nssfn,:phone)
  	end
end
