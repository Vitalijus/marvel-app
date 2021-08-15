require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "request list of comics" do
    it "return home page comics" do
      VCR.use_cassette("MarvelService/Marvel/return_marvel_comics") do
        marvel_service = MarvelService::Marvel.new
        marvel = marvel_service.response

        expect(marvel_service.results).not_to be_empty
        expect(marvel_service.errors).to be_nil
      end
    end

    it "returns search page comics when search query provided" do
      VCR.use_cassette("MarvelService/SearchMarvel/return_marvel_comics_by_search_query") do
        marvel_service = MarvelService::SearchMarvel.new("deadpool")
        marvel = marvel_service.response

        expect(marvel_service.results).not_to be_empty
        expect(marvel_service.errors).to be_nil
      end
    end

    it "returns search page comics when search query not found" do
      VCR.use_cassette("MarvelService/SearchMarvel/expect_no_result_when_query_not_found") do
        marvel_service = MarvelService::SearchMarvel.new("superman")
        marvel = marvel_service.response

        expect(marvel_service.results).to be_nil
        expect(marvel_service.errors).to match("No results")
      end
    end
  end
end
