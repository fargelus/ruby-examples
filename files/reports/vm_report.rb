require_relative 'stats_factory'
require_relative 'csv_report'
require_relative 'report_printer'

class VMReport
  def initialize(type)
    @stats = StatsFactory.produce(type.to_sym)
  end

  def buildFromCSV(count)
    @stats.extend(CSVReport)
    @stats.collect(count)
    ReportPrinter.call(@stats)
  end
end
