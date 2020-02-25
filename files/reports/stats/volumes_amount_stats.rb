require_relative 'base_stats'

class VolumesAmountStats < BaseStats
  def initialize
    super
    @type = 'sata'
  end

  def collect(n)
    prepare_volumes_data
    calc_volumes_amount
    sort_volumes_amount
    cut_volumes_amount(n)
    @volumes_amount.each_pair do |id, amount|
      vol = @volumes.find { |vol| vol[:vm_id] == id }
      vol[:amount] = amount
      @data << vol
    end
  end

  private

  def prepare_volumes_data
    @volumes = parse_volumes
    @volumes = @volumes.select { |vol| vol[:hdd_type] == @type }
  end

  def calc_volumes_amount
    @volumes_amount = {}
    @volumes.each do |vol|
      id = vol[:vm_id]
      @volumes_amount[id] = 0 unless @volumes_amount.include? id
      @volumes_amount[id] += 1
    end
  end

  def sort_volumes_amount
    sorted = @volumes_amount.sort_by(&:last).reverse.to_h
    @volumes_amount = sorted
  end

  def cut_volumes_amount(n)
    @volumes_amount = @volumes_amount.take(n).to_h
  end
end
