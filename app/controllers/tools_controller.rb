class ToolsController < ApplicationController

	def index
    if params[:tag]
      @tools = Tool.tagged_with(params[:tag])
    else
  	 @tools = Tool.order('tools.created_at DESC').page(params[:page])
    end  
  end

  def new
  	@tool = Tool.new
  end

  def create
  	@tool = Tool.new(tool_params)
    if @tool.save
      redirect_to "/tools"
    else
      render "new"
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
  	@tool = Tool.find(params[:id])
   
  end

  def update
  	@tool = Tool.find(params[:id])

  	if @tool.update_attributes(tool_params)
  		redirect_to @tool
    else
      render :edit
    end
  end


  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_url
  end

  private

  def tool_params
  	params.require(:tool).permit(:barcode, :description, :warranty_end, :model_number, :calibration_end, :quantity, :notes, :tag_list, :image)
  end


end
