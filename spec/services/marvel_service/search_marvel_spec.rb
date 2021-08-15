require "rails_helper"

RSpec.describe MarvelService::SearchMarvel, type: :model do
  describe "successfull marvel response object" do

    subject { MarvelService::SearchMarvel }

    it "should return marvel comics by search query" do
      VCR.use_cassette("MarvelService/SearchMarvel/return_marvel_comics_by_search_query") do
        marvel_service = subject.new("deadpool")
        call_marvel = marvel_service.request_marvel
        response = marvel_service.response

        expect(call_marvel.status).to eq 200
        expect(marvel_service.results).not_to be_empty
        expect(marvel_service.errors).to be_nil
      end
    end

    it "should expect no results when search query not found" do
      VCR.use_cassette("MarvelService/SearchMarvel/expect_no_results_when_query_not_found") do
        marvel_service = subject.new("superman")
        call_marvel = marvel_service.request_marvel
        response = marvel_service.response

        expect(call_marvel.status).to eq 200
        expect(marvel_service.results).to be_nil
        expect(marvel_service.errors).to match("No results")
      end
    end
  end
end
