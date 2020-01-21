# frozen_string_literal: true

require 'api_sigv2/version'
require 'api_sigv2/configuration'

module ApiSigv2
  autoload :Builder, 'api_sigv2/builder'
  autoload :Validator, 'api_sigv2/validator'
  autoload :Signer, 'api_sigv2/signer'
  autoload :Signature, 'api_sigv2/signature'
  autoload :AuthHeader, 'api_sigv2/auth_header'
  autoload :Utils, 'api_sigv2/utils'

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  # @example
  #   ApiSigv2.setup do |config|
  #     config.signature_ttl = 2.minutes
  #   end
  #
  def self.setup
    yield configuration
  end
end
