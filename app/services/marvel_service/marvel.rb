module MarvelService
  class Marvel < MarvelService::Base
    attr_accessor :errors

    def request_marvel(offset)
      HTTP.get(comics_endpoint + "&limit=100&offset=#{offset}")
    rescue HTTP::Error => e
      Rails.logger.error("Unexpected response: #{e.message}")
      {}
    end

    def response(offset=0)
      response = request_marvel(offset).parse

      if response["data"]["results"].blank?
        @errors = "No results"
      else
        response["data"]["results"].each do |result|
          puts result["id"]
        end
      end

      recall(response["data"]["offset"], response["data"]["count"])
    end

    private

    def recall(offset, count)
      send(:response, offset + 100) unless count < 100
    end
  end
end
