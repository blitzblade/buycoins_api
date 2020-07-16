require "rails_helper"
require "ostruct"

RSpec.describe ApiController, type: :controller do
  describe "GET #heartbeat" do
    it "returns successfully pings the api endpoint" do
      get :heartbeat
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #execute" do
    it "calculates buy price" do
      allow(HTTParty).to receive(:get).and_return(OpenStruct.new(body: { "bpi" => { "USD" => { "rate" => 10_000 } } }.to_json))
      post :execute, params: { query: "{ calculatePrice(margin: 1, type: BUY, exchangeRate: 390.00 ) }" }
      puts "PRICE: #{response.body.inspect}"
      price = JSON.parse(response.body)["data"]["calculatePrice"]
      expect(price).to eq(3_939_000.0)
    end

    it "calculates sell price" do
      allow(HTTParty).to receive(:get).and_return(OpenStruct.new(body: { "bpi" => { "USD" => { "rate" => 10_000 } } }.to_json))
      post :execute, params: { query: "{ calculatePrice(margin: 1, type: SELL, exchangeRate: 390.00 ) }" }
      price = JSON.parse(response.body)["data"]["calculatePrice"]
      expect(price).to eq(3_861_000.0)
    end

    it "ensure hash params" do
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: "12345" } }.to raise_exception(ArgumentError)
      allow(Rails.env).to receive(:development?).and_return(true)
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: "12345" } }.not_to raise_exception
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: "" } }.not_to raise_exception
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: { test: "test" } } }.not_to raise_exception
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: nil } }.not_to raise_exception
    end
  end
end
