# frozen_string_literal: true

require "yaml"

require_relative "active_campaign_rb/version"
require_relative "active_campaign_rb/errors"
require_relative "active_campaign_rb/transform_hash"
require_relative "active_campaign_rb/faraday/middleware"
require_relative "active_campaign_rb/config"
require_relative "active_campaign_rb/http_client"

#
# API Client for the Active Campaign API v3
#
#
module ActiveCampaignRb
  module_function

  ENDPOINTS = YAML.load_file(File.join(File.dirname(__FILE__), "active_campaign_rb", "endpoints.yaml"))

  def config
    @config ||= Config.new
  end

  def configure
    yield config if block_given?
  end

  def http_client
    @http_client ||= HttpClient.new(config)
  end

  ENDPOINTS.each do |name, config|
    define_method(name) do |args|
      http_methods = config.dig(:link, :method)
      request_path = config.dig(:link, :href)

      case http_methods
      when :GET, :get
        http_client.get(request_path % args, args)
      when :POST, :post
        http_client.post(request_path % args, args)
      when :PUT, :put
        http_client.put(request_path % args, args)
      when :PATCH, :patch
        http_client.path(request_path % args, args)
      when :DELETE, :delete
        http_client.delete(request_path % args, args)
      else
        raise InvalidHTTPMethod, "Invalid http_method specified"
      end
    rescue ::KeyError => e
      raise ArgumentError, e
    end
  end
end
