module MarvelService
  class Marvel < MarvelService::Base
    attr_accessor :errors, :results

    def initialize(search)
      @search = search
    end

    def request_marvel
      HTTP.get(comics_endpoint + "&title=#{@search}")
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
