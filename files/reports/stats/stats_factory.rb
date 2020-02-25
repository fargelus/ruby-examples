require_relative 'cost_stats'
require_relative 'capacity_stats'
require_relative 'volumes_amount_stats'

class StatsFactory
  TYPES = %i[expensive cheap capacity volumes_amount volumes_capacity]
  private_methods :new

  def self.produce(type)
    case type
    when :expensive, :cheap
      cost_stats = CostStats.new
      cost_stats.reverse_order if type == :expensive
      cost_stats
    when :capacity
      CapacityStats.new
    when :volumes_amount
      VolumesAmountStats.new
    else
      raise Exception.new "Unsupport report type: #{type}"
    end
  end
end
