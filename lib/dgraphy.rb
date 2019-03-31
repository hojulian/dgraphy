require_relative 'dgraphy/version'
require_relative 'dgraphy/client'

class Dgraph
  def initialize(options = {})
    raise 'No address provided in constructor' unless addr

    @client = Client.new(options[:host], options[:port])
  end

  def alter(schema: nil, timeout: 10)
    return nil if schema.nil?

    @client.alter(schema: schema, timeout: timeout)
  end

  def query(query: nil, timeout: 10, raw: true)
    return nil if query.nil?

    @client.query(query: query, timeout: timeout, raw: raw)
  end

  def mutate(query: nil, timeout: 10)
    return nil if query.nil?

    @client.mutate(query: query, timeout: timeout)
  end

  def drop_all
    @client.drop_all
  end
end