# frozen_string_literal: true

require_relative 'base_stats'

class VolumesBaseStats < BaseStats
  def initialize
    super
    print 'Enter volume type: '
    @type = STDIN.gets.chomp
  end

  def collect(count)
    prepare_volumes_data
    calc_volumes_info
    sort_volumes_info
    cut_volumes_info(count)
  end

  private

  def prepare_volumes_data
    @volumes = parse_volumes
    check_type
    @volumes = @volumes.select { |vol| vol[:hdd_type] == @type }
  end

  def check_type
    types = @volumes.map { |vol| vol[:hdd_type] }.uniq
    err_str = "Unsupported volume type: #{@type}."\
              +"\nTypes should be: #{types.join(', ')}"
    raise err_str unless types.include? @type
  end

  def calc_volumes_info
    @volumes_info = {}
  end

  def sort_volumes_info
    @volumes_info = @volumes_info.sort_by(&:last).reverse.to_h
  end

  def cut_volumes_info(n)
    @volumes_info = @volumes_info.take(n).to_h
  end
end
