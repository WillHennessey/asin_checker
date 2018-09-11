require 'test_helper'

class AsinTest < ActiveSupport::TestCase
  should 'return a response code of 200 for a valid ASIN' do
    assert_equal 200, Asin.get_response_code('1455586692')
  end

  should 'return a response code of 404 for an invalid ASIN' do
    assert_equal 404, Asin.get_response_code('145558669A')
  end
end