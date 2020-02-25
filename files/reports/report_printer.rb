class ReportPrinter
  def initialize(stats)
    @data = stats.data
    @spacing_size = 15
  end

  def self.call(stats)
    new(stats).call
  end

  def call
    print_header
    print_body
  end

  private

  def print_header
    keys = @data[0].keys
    keys.each { |k| print_header_item(k.to_s) }
    puts
  end

  def print_header_item(item)
    margin = @spacing_size + item.size
    print item.upcase.ljust(margin, ' ')
  end

  def print_body
    @data.each do |item|
      item.each_pair do |code, value|
        margin = code.size + @spacing_size
        print value.to_s.ljust(margin, ' ')
      end
      puts
    end
  end
end
