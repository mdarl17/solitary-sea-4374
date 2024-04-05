class SearchController < ApplicationController
  def index
		@facade = SearchFacade.new
		@nation = params[:nation]
    @members = @facade.all_nation_members(@nation)
  end
end