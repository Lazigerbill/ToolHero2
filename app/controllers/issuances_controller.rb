class IssuancesController < ApplicationController
  def index
  	@issuances = Issuance.order('issuances.created_at DESC').page(params[:page])
  end

  def show
  	@issuance = Issuance.find(params[:id])
  end

  def new
  	@issuance = Issuance.new
  	# respond_to do |format|
  	# 	format.js {}
  	# 	format.html
  	
  end

  def create
  	@issuance = Issuance.new(issuance_params)
    # binding.pry
  	if @issuance.save
  		redirect_to "/issuances"
  	else
  		render "new"
  	# respond_to do |format|
  	# 	format.js {}
  	# 	format.html {redirect_to "/issuance"}
  	end
  end

  def edit
    @issuance = Issuance.find(params[:id])
  end

  def update
    @issuance = Issuance.find(params[:id])

    if @issuance.update_attributes(issuance_params)
      redirect_to @issuance
    else
      render :edit
    end 
  end

  private

  def issuance_params
  	params.require(:issuance).permit(:incoming_employee_barcode, :incoming_tool_barcode, :issued_at, :due_date, :returned_at, :outgoing_condition, :incoming_condition, :quantity)
  end

end
