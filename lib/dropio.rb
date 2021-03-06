module Dropio
  VERSION = '1.7.2'
  
  class MissingResourceError < Exception; end
  class AuthorizationError < Exception; end
  class RequestError < Exception; end
  class ServerError < Exception; end
  
  class Config
    class << self
      attr_accessor :api_key, :base_url, :api_url, :upload_url, :version, :debug, :manager_api_token, 
            :output_locations, :stock_output_locations, :user_output_locations, 
            :enabled_cdns
      
      def stock_output_locations
        ["DropioS3"]
      end
      
      def output_locations
        o = stock_output_locations.concat(user_output_locations)
        o
      end
      
      
    end
  end
  
end

require 'rubygems'
require 'rbconfig'
require 'mime/types'
require 'httparty'
require 'net/http/post/multipart'

Dropio::Config.base_url = "http://drop.io"
Dropio::Config.api_url = "http://api.drop.io"
Dropio::Config.upload_url = "http://assets.drop.io/upload"
Dropio::Config.version = "3.0"
Dropio::Config.debug = false
Dropio::Config.enabled_cdns = ["akamai", "voxel", "limelight"]

require 'dropio/api'
require 'dropio/client'
require 'dropio/resource'
require 'dropio/drop'
require 'dropio/asset'
require 'dropio/comment'
require 'dropio/subscription'
