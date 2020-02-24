require_relative 'report_factory'
require_relative 'csv_report'

class VMReport
  def self.buildFromCSV(type, count)
    report = ReportFactory.create(type)
    report.extend(CSVReport)
    report.build(count)
  end
end
