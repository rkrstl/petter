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
      redirect_to plans_path
    else
      render :new
   end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path
     else
    render :edit
  end
  end

 


  def destroy
    plan = Plan.find(params[:id])
    if plan.destroy
       redirect_to plans_path
    else
      render :index
    end
 end





  def show
    @plan=Plan.find(params[:id])
    
  end

private
 
def plan_params
  params.require(:plan).permit(:title,:content,:start_time,:tag).merge(user_id:current_user.id)
end


end
