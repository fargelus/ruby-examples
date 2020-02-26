#!/usr/bin/env ruby

require_relative 'vm_report'

report_type, total = ARGV
VMReport.new(report_type).build_from_csv(total)
