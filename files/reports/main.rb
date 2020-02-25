#!/usr/bin/env ruby

require_relative 'vm_report'

report_type, count = ARGV
VMReport.new(report_type).build_from_csv(count)
