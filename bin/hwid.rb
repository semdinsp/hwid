#!/usr/bin/env ruby
require 'rubygems'
require 'hwid'
puts 'System id is: ' + Hwid.systemid
puts "Platform is:" + Hwid.platform.join(',')