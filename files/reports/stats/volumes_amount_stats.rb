require_relative 'volumes_base_stats'

class VolumesAmountStats < VolumesBaseStats
  def collect(count)
    super count
    @volumes_info.each_pair do |id, amount|
      target = @volumes.find { |vol| vol[:vm_id] == id }
      target[:amount] = amount
      @data << target
    end
  end

  private

  def calc_volumes_info
    super
    @volumes.each do |vol|
      id = vol[:vm_id]
      @volumes_info[id] = 0 unless @volumes_info.include? id
      @volumes_info[id] += 1
    end
  end
end
