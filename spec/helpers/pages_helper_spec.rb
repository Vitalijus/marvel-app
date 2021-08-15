require 'rails_helper'

RSpec.describe PagesHelper, type: :helper do
  describe "string concat" do
    it "concats two strings into url address" do
      expect(helper.cover_thumbnail_helper("www.address.com/image","jpg")).to eq("www.address.com/image.jpg")
    end
  end
end
