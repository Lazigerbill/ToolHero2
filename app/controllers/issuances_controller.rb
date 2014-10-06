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
  	if @issuance.save
  		redirect_to "/issuances"
  	else
  		render "new"
  	# respond_to do |format|
  	# 	format.js {}
  	# 	format.html {redirect_to "/issuance"}
  	end
  end

  private

  def issuance_params
  	params.require(:issuance).permit(:employee_id, :tool_id, :issued_at, :due_date, :returned_at, :outgoing_condition, :incoming_condition, :quantity)
  end

end
