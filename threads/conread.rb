# frozen_string_literal: true

require 'open-uri'
require 'yaml'

def conread(filenames)
  h = {}

  filenames.each do |f|
    h[f] = Thread.new do
      open(f, &:read)
    end
  end

  h.each_pair do |fn, thread|
    begin
      h[fn] = thread.value
    rescue StandardError
      h[fn] = $ERROR_INFO
    end
  end

  h
end

puts conread(ARGV).to_yaml
