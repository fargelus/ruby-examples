# frozen_string_literal: true

require_relative 'base_stats'

class CostStats < BaseStats
  def initialize
    super
    @order = :asc
  end

  def reverse_order
    @order = :desc
  end

  def collect(count)
    @vms = parse_vms
    @prices = parse_prices
    calc_cost
    sort_by_order
    @data = @vms.take(count)
  end

  private

  def calc_cost
    @vms.each do |vm|
      cost = 0
      cost += vm[:cpu] * @prices[:cpu]
      cost += vm[:ram] * @prices[:ram]
      hdd_type = vm[:hdd_type].to_sym
      cost += @prices[hdd_type] * vm[:hdd_capacity]
      vm[:cost] = cost
    end
  end

  def sort_by_order
    @vms.sort_by! { |vm| vm[:cost] }
    @vms.reverse! if @order == :desc
  end
end
