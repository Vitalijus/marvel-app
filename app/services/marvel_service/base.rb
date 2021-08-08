require 'digest/md5'

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

    def timestamp
      Time.now.strftime("%Y%m%d")
    end

    def md5_encrypt
      Digest::MD5.hexdigest(timestamp+private_key+public_key)
    end

    def comics_endpoint
      base_url + "ts=#{timestamp}&apikey=#{public_key}&hash=#{md5_encrypt}"
    end
  end
end
