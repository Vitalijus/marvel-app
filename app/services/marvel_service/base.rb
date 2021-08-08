module MarvelService
  class Base
    def public_key
      ENV.fetch("MARVEL_PUBLIC_KEY")
    end

    def private_key
      ENV.fetch("MARVEL_PRIVATE_KEY")
    end

    def base_url
      ENV.fetch("MARVEL_BASE_URL")
    end

    def comics_endpoint
      # binding.pry
      base_url + ":443/v1/public/comics?apikey=#{private_key}"
    end
  end
end
