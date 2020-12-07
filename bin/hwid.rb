#!/usr/bin/env ruby
require 'rubygems'
require 'hwid'
puts 'System id is: ' + Hwid.systemid.to_s
puts "Platform is: " + Hwid.platform.join(',')