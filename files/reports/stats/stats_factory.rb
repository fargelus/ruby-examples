require_relative 'cost_stats'
require_relative 'capacity_stats'
require_relative 'volumes_amount_stats'
require_relative 'volumes_capacity_stats'

class StatsFactory
  private_methods :new
  
  TYPES_TO_STATS = {
    cheap: CostStats,
    expensive: CostStats,
    capacity: CapacityStats,
    volumes_amount: VolumesAmountStats,
    volumes_capacity: VolumesCapacityStats
  }

  def self.produce(type)
    stats_class = TYPES_TO_STATS[type]
    raise Exception.new "Unsupport report type: #{type}" unless stats_class
    stats_obj = stats_class.new
    stats_obj.reverse_order if type == :expensive
    stats_obj
  end
end
