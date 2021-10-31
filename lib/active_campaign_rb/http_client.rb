# frozen_string_literal: true

module ActiveCampaignRb
  #
  # HTTP Client wrapper
  #
  class HttpClient
    attr_reader :connection

    def initialize(opts = {})
      @connection = ::Faraday.new(url: opts.api_endpoint) do |f|
        ActiveCampaignRb::Faraday::Middleware.add_request_middleware(f, opts.request_middleware)
        ActiveCampaignRb::Faraday::Middleware.add_response_middleware(f, opts.response_middleware)
        f.adapter opts.adapter

        f.headers = {
          "Accept" => "application/json",
          "Content-Type" => "application/json",
          "Api-Token" => opts.api_key,
          "User-Agent" => "ActiveCampaignRb Client (v#{ActiveCampaignRb::VERSION})"
        }
      end
    end

    def post(*args)
      safe_http_call do
        connection.post(*args)
      end
    end

    def patch(*args)
      safe_http_call do
        connection.patch(*args)
      end
    end

    def put(*args)
      safe_http_call do
        connection.put(*args)
      end
    end

    def delete(*args)
      safe_http_call do
        connection.delete(*args)
      end
    end

    def get(*args)
      safe_http_call do
        connection.get(*args)
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    def safe_http_call
      response = yield
      response.body
    rescue ::Oj::ParseError => e
      raise ParsingError, e
    rescue ::Faraday::BadRequestError => e
      raise BadRequestError, e
    rescue ::Faraday::UnauthorizedError => e
      raise UnauthorizedError, e
    rescue ::Faraday::ForbiddenError => e
      raise ForbiddenError, e
    rescue ::Faraday::ResourceNotFound => e
      raise ResourceNotFound, e
    rescue ::Faraday::ProxyAuthError => e
      raise ProxyAuthError, e
    rescue ::Faraday::ConflictError => e
      raise ConflictError, e
    rescue ::Faraday::UnprocessableEntityError => e
      raise UnprocessableEntityError, e
    rescue ::Faraday::ServerError => e
      raise ServerError, e
    rescue ::Faraday::TimeoutError => e
      raise TimeoutError, e
    rescue ::Faraday::NilStatusError => e
      raise NilStatusError, e
    rescue ::Faraday::ConnectionFailed => e
      raise ConnectionFailed, e
    rescue ::Faraday::SSLError => e
      raise SSLError, e
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize
  end
end
