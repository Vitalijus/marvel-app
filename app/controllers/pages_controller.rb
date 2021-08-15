class PagesController < ApplicationController
  def home
    marvel_service = MarvelService::Marvel.new
    marvel = marvel_service.response

    if marvel_service.results.present?
      @results = marvel_service.results
    else
      @errors = marvel_service.errors
    end
  end

  def search
    if params[:search_query].present?
      marvel_service = MarvelService::SearchMarvel.new(params[:search_query])
      marvel = marvel_service.response

      if marvel_service.results.present?
        @results = marvel_service.results
      else
        @errors = marvel_service.errors
      end
    else
      @errors = "Please provide search term"
    end
  end
end
