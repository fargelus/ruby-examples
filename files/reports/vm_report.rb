require_relative 'stats/stats_factory'
require_relative 'csv_report'
require_relative 'report_printer'

class VMReport
  def initialize(type)
    @stats = StatsFactory.produce(type.to_sym)
  end

  def build_from_csv(total)
    @stats.extend(CSVReport)
    @stats.collect(total.to_i)
    ReportPrinter.call(@stats.data)
  end
end
