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
  s.summary     = "Records column modification times."
  s.description = "Records modification time for specified database columns on a per-row basis (ActiveRecord)."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2"

  s.add_development_dependency "sqlite3",            "~> 1.3.6"
  s.add_development_dependency "rspec-rails",        "~> 2.10"
  s.add_development_dependency "factory_girl",       "~> 2.6.4"
  s.add_development_dependency "factory_girl_rails", "~> 1.7"
  s.add_development_dependency "timecop",            "~> 0.3.5"
end
