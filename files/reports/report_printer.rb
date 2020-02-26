class ReportPrinter
  def initialize(data)
    @data = data
    @spacing_size = 15
  end

  def self.call(data)
    new(data).call
  end

  def call
    print_header
    print_body
  end

  private

  def print_header
    @data[0].keys.each { |k| print_header_item(k.to_s) }
    puts
  end

  def print_header_item(item)
    space_num = @spacing_size + item.size
    print item.upcase.ljust(space_num, ' ')
  end

  def print_body
    @data.each do |item|
      item.each_pair do |code, value|
        space_num = code.size + @spacing_size
        print value.to_s.ljust(space_num, ' ')
      end
      puts
    end
  end
end
