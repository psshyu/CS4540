class ExecutedSearchesController < ApplicationController

  # aka, rerun the search
  def update
    @eys = ExecutedSearch.find(params[:id])
    @eys.run
    redirect_to executed_search_path(@eys)
  end

  def show
    @eys = ExecutedSearch.find(params[:id])
  end
end
