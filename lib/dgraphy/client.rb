require 'json'
require 'net/http'

class Client
  def initialize(addr, port)
    @client = Net::HTTP.new(addr, port)
  end

  def alter(schema: nil, timeout: 10)
    req = Net::HTTP::Post.new('/alter')
    req['accept'] = 'application/json'
    # req.continue_timeout = timeout
    req.body = schema

    res = @client.request(req)
    body = JSON.parse(res.body, symbolize_names: true)
    body.dig(:data, :code).equal? 'Success'
  end

  def query(query: nil, timeout: 10, raw: true)
    req = Net::HTTP::Post.new('/query')
    req['accept'] = 'application/json'
    # req.continue_timeout = timeout
    req.body = query

    res = @client.request(req)

    if raw
      JSON.parse(res.body, symbolize_names: true)
    else
      JSON.parse(res.body, symbolize_names: true).dig(:data)
    end
  end

  def mutate(query: nil, timeout: 10)
    req = Net::HTTP::Post.new('/mutate')
    req['accept'] = 'application/json'
    # req.continue_timeout = timeout
    req.body = query

    res = @client.request(req)
    body = JSON.parse(res.body, symbolize_names: true)
    body.dig(:data, :code).equal? 'Success'
  end

  def drop_all
    req = Net::HTTP::Post.new('/alter')
    req['accept'] = 'application/json'
    req.body = '{"drop_all": true}'

    res = @client.request(req)
    body = JSON.parse(res.body, symbolize_names: true)
    body.dig(:data, :code).equal? 'Success'
  end
end