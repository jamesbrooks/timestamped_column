require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require
require "timestamped_column"

module Dummy
  class Application < Rails::Application
  end
end

