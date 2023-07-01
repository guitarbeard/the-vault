require 'rails_helper'

RSpec.describe "/api/fragrances", type: :request do
  describe "#index" do
    it "returns all fragrances" do
      fragrance =  create :fragrance
      get "/api/fragrances"
      json = JSON.parse(response.body)
      expect(json.first['id']).to eq fragrance.id
      expect(json.first['name']).to eq fragrance.name
      expect(json.first['x']).to eq fragrance.x
      expect(json.first['y']).to eq fragrance.y
    end
  end
end