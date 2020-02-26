require 'csv'

module CSVReport
  BASE_PATH = 'formats/csv/'
  FILES = {
    prices: "#{BASE_PATH}prices.csv",
    vms: "#{BASE_PATH}vms.csv",
    volumes: "#{BASE_PATH}volumes.csv",
  }

  def parse_vms
    vms = []
    CSV.foreach(FILES[:vms]) do |row|
      vms << vm_hash_for(row)
    end
    vms
  end

  def vm_hash_for(raw_data)
    vm = {}
    id, cpu, ram, hdd_type, hdd_capacity = raw_data
    vm[:id], vm[:cpu], vm[:ram] = id, cpu, ram
    vm[:hdd_type], vm[:hdd_capacity] = hdd_type, hdd_capacity
    vm.each { |k, v| vm[k] = v.to_i if /[0-9]+/ =~ v }
  end

  def parse_prices
    prices = {}
    CSV.foreach(FILES[:prices]) do |row|
      prices[row[0].to_sym] = row[1].to_i
    end
    prices
  end

  def parse_volumes
    volumes = []
    CSV.foreach(FILES[:volumes]) do |vol|
      volumes << volume_hash_for(vol)
    end
    volumes
  end

  def volume_hash_for(vol)
    volume = {}
    volume[:vm_id], volume[:hdd_type], volume[:hdd_capacity] = vol
    volume[:hdd_capacity] = volume[:hdd_capacity].to_i
    volume
  end
end
