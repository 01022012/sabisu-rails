require 'httparty'

module Sabisu
  extend ActiveSupport::Autoload

  autoload :Request
  autoload :RouteRecognizer
  autoload :Explorer
  autoload :Helpers
  autoload :Builders

  # We ignore some attribues that might cause a collision between models
  @@default_ignored_attributes = %w{ created_at updated_at id }

  # We append the extra attributes you want to ignore to the default ones
  mattr_accessor :ignored_attributes
  @@ignored_attributes = @@ignored_attributes.to_a + @@default_ignored_attributes

  # Base api uri for the endpoints
  mattr_accessor :base_api_uri
  @@base_api_uri = nil

  # HTTP methods for the api
  @@default_http_methods = %w{ GET POST PUT DELETE PATCH }

  mattr_accessor :http_methods
  @@http_methods = @@http_methods.to_a + @@default_http_methods

  # Headers to include on each request
  mattr_accessor :api_headers
  @@api_headers = {}

  # Layout
  mattr_accessor :layout
  @@layout = "sabisu"

  # Resources
  mattr_accessor :resources
  @@resources = []

  # Authentication
  mattr_accessor :authentication_username
  @@authentication_username = "admin"

  mattr_accessor :authentication_password
  @@authentication_password = "sekret"

  mattr_accessor :app_name
  @@app_name = 'Sabisu'

  @@configured = false

  def self.configured? #:nodoc:
    @@configured  
  end

  #Method to configure sabisu
  def self.setup
    @@configured = true

    yield self
  end

end

require 'sabisu/railtie' 
require 'sabisu/engine'
require "sabisu/version"
