class SearchController < ApplicationController

  def new
  	@tools = Tool.search_including_tags(params[:query])
  	@employees = Employee.search_including_tags(params[:query])
  end

end
