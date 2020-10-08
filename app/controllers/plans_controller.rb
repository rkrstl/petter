class PlansController < ApplicationController


  def index

    @plans = current_user.plans
  end

  def new
     @plan= Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
   end
  end


  def show
    @plan=Plan.find(params[:id])
    
  end

private
 
def plan_params
  params.require(:plan).permit(:title,:content,:start_time).merge(user_id:current_user.id)
end


end
