module MarvelService
  class SearchMarvel < MarvelService::Base
    attr_accessor :errors, :results

    def initialize(search)
      @search = "&title=#{search}"
    end

    def request_marvel
      HTTP.get(comics_endpoint + @search)
    rescue HTTP::Error => e
      Rails.logger.error("Unexpected response: #{e.message}")
      {}
    end

    def response
      response = request_marvel.parse["data"]["results"]

      if response.blank?
        @errors = "No results"
      else
        @results = response
      end
    end

    private
  end
end
