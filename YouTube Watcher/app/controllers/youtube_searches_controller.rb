class YoutubeSearchesController < ApplicationController

  include ExecutedSearchesHelper

  def index
    @youtube_searches = current_user.youtube_searches
  end

  def new
    @ys = YoutubeSearch.new
  end

  def create
    @ys = YoutubeSearch.new(safe_params.merge(user: current_user))
    if @ys.save
      check_for_include_results
      redirect_to @ys
    else
      render :edit
    end
  end

  def edit
    @ys = YoutubeSearch.find(params[:id])
  end

  def update
    @ys = YoutubeSearch.find(params[:id])
    @ys.update_attributes(safe_params)
    check_for_include_results
    render :edit
  end

  def show
    @ys = YoutubeSearch.find(params[:id])
  end

  private

  # whitelist parameters coming from form posts to ensure security
  def safe_params
    params.require(:youtube_search).permit(:search_terms, :name, :alert_on_new_result)
  end

  def check_for_include_results
    if params['commit'] == 'Save and Run'
      @include_results = true
      @ys.execute!
      @eys = @ys.executed_searches.most_recent
    else
      @include_results = false
    end
  end
end
