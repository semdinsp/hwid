Gem::Specification.new do |s|
  s.name        = "hwid"
  s.version     = "0.2.0"
  s.author      = "Scott Sproule"
  s.email       = "scott.sproule@ficonab.com"
  s.homepage    = "http://github.com/semdinsp/hwid"
  s.summary     = "Hardware id for mac and rasp pi (not secure)"
  s.description = "Get a rough hardware id of the system that the gem is running on" 
  s.executables = ['hwid.rb']    #should be "name.rb"
  s.files        = Dir["{lib,test}/**/*"] +Dir["bin/*.rb"] + Dir["[A-Z]*"] # + ["init.rb"]
  s.require_path = "lib"
  s.license = 'MIT'
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
