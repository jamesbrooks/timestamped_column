require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require
require "timestamped_column"

module Dummy
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end

