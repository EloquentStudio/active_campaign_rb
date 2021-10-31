# frozen_string_literal: true

module ActiveCampaignRb
  #
  # Config object
  #
  class Config
    attr_accessor :api_endpoint, :api_key, :debug, :adapter, :request_middleware, :response_middleware
    alias debug? debug

    def initialize(opts = {})
      @api_endpoint = opts[:api_endpoint]
      @api_key = opts[:api_key]
      @debug = opts.fetch(:api_key, false)
      @adapter = opts.fetch(:adapter, :net_http)
      @request_middleware = opts.fetch(:request_middleware, {})
      @response_middleware = opts.fetch(:response_middleware, {})
    end
  end
end
