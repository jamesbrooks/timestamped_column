$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "timestamped_column/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "timestamped_column"
  s.version     = TimestampedColumn::VERSION
  s.authors     = ["James Brooks"]
  s.email       = ["james@jamesbrooks.net"]
  s.homepage    = "https://github.com/JamesBrooks/timestamped_column"
  s.summary     = "Records modified time for individual columns."
  s.description = "Records modified time for individual columns."

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails'
  s.add_dependency 'activesupport'
end
