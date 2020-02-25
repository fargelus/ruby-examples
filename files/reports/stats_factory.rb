require_relative 'lib/cost_stats'

class StatsFactory
  TYPES = %i[expensive cheap capacity hdd_amount hdd_volume]
  private_methods :new

  def self.produce(type)
    case type
    when :expensive, :cheap
      cost_stats = CostStats.new
      cost_stats.reverse_order if type == :expensive
      cost_stats
    else
      raise Exception.new "Unsupport report type: #{type}"
    end
  end
end
