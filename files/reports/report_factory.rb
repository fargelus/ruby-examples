require_relative 'lib/cost_report'


class ReportFactory
  TYPES = %i[expensive cheap capacity hdd_amount hdd_volume]
  private_methods :new

  def self.create(type)
    type = type.to_sym
    case type
    when :expensive, :cheap
      cost_report = CostReport.new
      cost_report.order = type == :expensive ? :desc : :asc
      cost_report
    else
      raise Exception.new "Unsupport report type: #{type}"
    end
  end
end
