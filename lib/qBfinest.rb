require "qBfinest/version"
require "oauth"
require 'pry'
module QBfinest
  require 'qBfinest/company'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :qb_key, :qb_secret, :consumer, :access_token

    def initialize
      @consumer = OAuth::Consumer.new(qb_key,qb_secret, {
                                        :site                 => "https://oauth.intuit.com",
                                        :request_token_path   => "/oauth/v1/get_request_token",
                                        :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
                                        :access_token_path    => "/oauth/v1/get_access_token"
                                      })
    end

    def create_access_token(options={})
      @access_token = OAuth::AccessToken.new(@consumer, options[:token], options[:secret])
    end
  end

  QBfinest.configure do |config|
    config.qb_key = 
    config.qb_secret = 
  end
end
