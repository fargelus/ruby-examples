require_relative 'volumes_base_stats'

class VolumesCapacityStats < VolumesBaseStats
  def collect(count)
    super()
    calc_volumes_capacity
    @volumes_capacity.each_pair do |id, capacity|
      target = @volumes.find { |vol| vol[:vm_id] == id }
      target[:capacity] = capacity
      @data << target
    end
  end

  private

  def calc_volumes_capacity
    @volumes_capacity = {}
    @volumes.each do |vol|
      id = vol[:vm_id]
      @volumes_capacity[id] = 0 unless @volumes_capacity.include? id
      @volumes_capacity[id] += vol[:hdd_capacity]
    end
  end
end
