class SearchController < ApplicationController

  def new
  	results = PgSearch.multisearch(params[:query]).map do |result|
  		result.searchable_type.classify.constantize.find(result.searchable_id)
  	end


  	@tools = results.select{|x| x.class == Tool} || []
  	@employees = results.select{|x| x.class == Employee} || []
  end

end
