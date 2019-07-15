puts File.dirname(__FILE__)
#require File.dirname(__FILE__) + '/test_helper.rb' 
require File.expand_path("../test_helper", __FILE__)
#require File.dirname(__FILE__) + '/test_helper.rb' 
#require  'test_helper.rb' 
require  'test_helper' 


class HwidTest <  Minitest::Test

  def setup
    @f=Hwid::Base.new
    
  end
  
  def test_basic
    assert @f!=nil, "should be created"
    puts "PLATFORM #{@f.get_platform}"
  end
  def test_prase
    @f.parse('Serial: 1234')
    assert @f.parse('Serial: 1234')=='1234', "basic parse"
    assert @f.parse('Serial:1234')=='1234', "basic parse no blanks"
    assert @f.parse('Serial:1234 ')=='1234', "basic parse trailing blank"
    assert @f.parse(' ')=='unknown', "bad parse"
  end
  def test_system
    assert @f.systemid!='unknown', "return id"
  end
  def test_class
     assert Hwid.systemid!='unknown', "return id is #{Hwid.systemid}"
     assert Hwid.platform!='unknown', "return id is #{Hwid.platform}"
  end
  def test_run_cmd
     d =@f.run_cmd('date')
     t=Time.now.day
     puts d
     assert d.include?(t.to_s), "date is #{d} day is #{t}"
    
  end
    
end
  
 
 
