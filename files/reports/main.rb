#!/usr/bin/env ruby

require_relative 'vm_report'

report_type, count = ARGV
puts VMReport.buildFromCSV(report_type, count)
