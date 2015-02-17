$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "french_postal_codes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "french_postal_codes"
  s.version     = FrenchPostalCodes::VERSION
  s.authors     = ["Igor Pantovic"]
  s.email       = ["php.igor@gmail.com"]
  s.homepage    = "http://github.com/igorpan/french-postal-codes"
  s.summary     = "Contains french postal codes data and helpers to fetch it"
  s.license     = "MIT"

  s.files = Dir["{spec,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_development_dependency "rspec"
end
