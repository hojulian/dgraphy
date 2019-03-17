require 'minitest/autorun'

require_relative 'dgraph'

class TestDgraph < Minitest::Test
  @path = "http://ec2-18-220-195-165.us-east-2.compute.amazonaws.com"

  def test_query
    @client = Dgraph.new("ec2-18-220-195-165.us-east-2.compute.amazonaws.com", 8080)
    query = '{ students(func: eq(Type, "Student")) { uid } }'

    body = @client.query(query: query, timeout: 30)
    assert body != nil
    assert_equal body.dig(:data, :students).first.dig(:uid), "0x6"
  end
end