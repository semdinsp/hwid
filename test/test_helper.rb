require 'simplecov'
SimpleCov.start
puts "in test helper"
require 'rubygems'
require 'bundler/setup'
require "codeclimate-test-reporter"
require 'stringio'
require 'minitest/autorun'
require 'minitest/unit'

require File.dirname(__FILE__) + '/../lib/hwid'


