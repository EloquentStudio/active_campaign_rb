# frozen_string_literal: true

require "active_support/core_ext/string"

module ActiveCampaignRb
  #
  # Utility methods
  #
  module TransformHash
    module_function

    def transform_keys(hash, *new_case)
      hash.each_with_object({}) do |(key, value), memo|
        memo[transform_key(key, *new_case)] = transform_value(value, *new_case)
      end
    end

    def transform_key(key, *new_case)
      key.to_s.public_send(*new_case).to_sym
    end

    def transform_value(value, *new_case)
      case value
      when Hash
        transform_keys(value, *new_case)
      when Array
        transform_array(value, *new_case)
      else
        value
      end
    end

    def transform_array(collection, *new_case)
      collection.map do |element|
        case element
        when Hash
          transform_keys(element, *new_case)
        else
          element
        end
      end
    end
  end
end
