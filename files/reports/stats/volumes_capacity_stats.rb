# frozen_string_literal: true

require_relative 'volumes_base_stats'

class VolumesCapacityStats < VolumesBaseStats
  def collect(count)
    super(count)
    @volumes_info.each_pair do |id, capacity|
      target = @volumes.find { |vol| vol[:vm_id] == id }
      target[:capacity] = capacity
      @data << target
    end
  end

  private

  def calc_volumes_info
    super
    @volumes.each do |vol|
      id = vol[:vm_id]
      @volumes_info[id] = 0 unless @volumes_info.include? id
      @volumes_info[id] += vol[:hdd_capacity]
    end
  end
end
