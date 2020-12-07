$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  Dir[File.join(File.dirname(__FILE__), 'hwid/**/*.rb')].sort.each { |lib| require lib }

module Hwid
  VERSION = '0.4.1'
end