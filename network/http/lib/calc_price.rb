# frozen_string_literal: true

require_relative '../formats/csv_format'

class CalcPrice
  extend CSVFormat
  private_methods :new

  def initialize(params)
    @params = params
  end

  def self.call(params)
    @@prices ||= parse_prices
    new(params).call
  end

  def call
    prepare_params
    @params.keys.inject(0) do |sum, kit|
      price = @@prices[kit].to_i
      amount = @params[kit].to_i
      sum += price * amount if price
    end
  end

  private

  def prepare_params
    volume_type = @params.delete('hdd_type')
    volume_capacity = @params.delete('hdd_capacity')
    @params[volume_type] = volume_capacity
    handle_disks if @params.key? 'disks'
  end

  def handle_disks
    disks = {}
    disks_data = @params['disks'].split(',')
    type = ''
    disks_data.each do |disk_param|
      if disk_param =~ /[0-9]+/
        disks[type] += disk_param.to_i
      else
        type = disk_param
        disks[type] = 0 unless disks.key? type
      end
    end
    @params.merge!(disks) { |_key, old, new| old.to_i + new.to_i }
  end
end
