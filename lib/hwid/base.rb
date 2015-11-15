require 'rubygems'

module Hwid
  def self.systemid
    Hwid::Base.new.systemid
  end
  def self.platform
    Hwid::Base.new.get_platform
  end
  class Base
    attr_accessor :systemid
  
    def platform
    end
    #parse something like 'Serial : xxxx'
    def parse(line)
      res='unknown'
      raw=line.split(':')
      res=raw[1] if raw[1]!=nil
      res.strip
    end
    # returns array of platforms
    def get_platform
      platform=[]
      platform << "raspberry" if (/arm-linux/ =~ RUBY_PLATFORM) != nil
      platform << "raspberry 2" if (/armv7l-linux/ =~ RUBY_PLATFORM) != nil
      platform << "mac" if (/darwin/ =~ RUBY_PLATFORM) != nil
      platform << "arm" if (/arm/ =~ RUBY_PLATFORM) != nil
      platform << "x86" if (/x86/ =~ RUBY_PLATFORM) != nil
      platform << "linux" if (/linux/ =~ RUBY_PLATFORM) != nil
      platform
    end
    def systemid
      platform=get_platform
      # puts "platform is #{platform} #{RUBY_PLATFORM}"
      return get_rasp_id if platform.include?("raspberry")
      return get_rasp_id if platform.include?("raspberry 2")
      return get_mac_id if platform.include?("mac")
      return get_linux_id if platform.include?("linux")
    end
    def run_cmd(cmd)
      res=""
      begin
        res=`#{cmd}`
      rescue Exception => e
        res="Serial: unknown"
      end
      res
    end
    def get_rasp_id
      res=run_cmd('grep Serial  /proc/cpuinfo')
      self.parse(res)
    end
    def get_mac_id
      res=run_cmd('/usr/sbin/system_profiler SPHardwareDataType -timeout 0 | grep Serial')
      self.parse(res)
    end
    def get_linux_id
      res="Serial: unknown"
      ifconfig_avail = !(ifconfig_path = `which ifconfig`.strip).empty? && File.executable?(ifconfig_path)
      res=run_cmd('ifconfig | grep HWaddr').split.last if ifconfig_avail
      res
    end

   end    # Class
end    #Module