require_relative 'base_stats'

class CapacityStats < BaseStats
  def initialize
    super
    print 'Enter parameter: '
    @param = STDIN.gets.chomp.downcase.to_sym
  end

  def collect(n)
    @vms = parse_vms
    check_param
    @data = @vms.max_by(n) { |vm| vm[@param] }
  end

  private

  def check_param
    vm = @vms[0]
    err_str = "Unsupported capacity parameter: #{@param}."\
              +"\nCheck this params: #{vm.keys.join(', ')}"
    raise err_str unless vm.include? @param
  end
end
