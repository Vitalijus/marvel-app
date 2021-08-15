require "rails_helper"

RSpec.describe MarvelService::Marvel, type: :model do
  describe "successfull marvel response object" do

    subject { MarvelService::Marvel }

    it "should return marvel comics" do
      VCR.use_cassette("MarvelService/Marvel/return_marvel_comics") do
        marvel_service = subject.new
        call_marvel = marvel_service.request_marvel
        response = marvel_service.response

        expect(call_marvel.status).to eq 200
        expect(marvel_service.results).not_to be_empty
        expect(marvel_service.errors).to be_nil
      end
    end
  end
end
