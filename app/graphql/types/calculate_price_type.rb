module Types
  class CalculatePriceType < GraphQL::Schema::Object
    field :calculate_price, Float, null: false do
      argument :margin, Float, required: true
      argument :type, Types::EnumType, required: true
      argument :exchange_rate, Float, required: true
    end

    def calculate_price(margin:, type:, exchange_rate:)
      btc_price = get_btc_price.to_f

      adjusted_price = 0
      if type == "BUY"
        adjusted_price = btc_price + ((margin / 100.0) * btc_price)
      elsif type == "SELL"
        adjusted_price = btc_price - ((margin / 100.0) * btc_price)
      end
      adjusted_price * exchange_rate
    end

    def get_btc_price
      api_url = "https://api.coindesk.com/v1/bpi/currentprice/BTC.json"
      response = HTTParty.get(api_url)
      puts "RESPONSE: #{response.inspect}"
      response = JSON.parse(response.body)
      response["bpi"]["USD"]["rate"]
    end
  end
end
