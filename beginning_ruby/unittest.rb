class String
    def titlelize
        self.gsub(/(\A|\s)\w/) { |letter| letter.upcase }
    end  
end

require 'minitest/autorun'
#require 'test/unit'

#class TestTitlelize < Test::Unit::TestCase
class TestTitlelize < Minitest::Test
    def test_basic
        assert_equal("This Is A Test", "this is a test".titlelize)
        assert_equal("Another Test 1234", "another test 1234".titlelize)
        assert_equal("We're Testing", "We're testing".titlelize)
    end
end