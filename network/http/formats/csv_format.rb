require 'csv'
require 'pathname'

module CSVFormat
  BASE_PATH = Pathname.new(__FILE__).join('../../data/csv/')
  FILES = {
    prices: "#{BASE_PATH}prices.csv",
  }

  def parse_prices
    prices = {}
    CSV.foreach(FILES[:prices]) do |row|
      kit, price = row
      prices[kit] = price
    end
    prices
  end
end
