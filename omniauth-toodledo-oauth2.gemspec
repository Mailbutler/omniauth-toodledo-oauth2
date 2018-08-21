
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/toodledo_oauth2/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-toodledo-oauth2"
  spec.version       = Omniauth::ToodledoOauth2::VERSION
  spec.authors       = ["Honey Go"]
  spec.email         = ["honelyn@mailbutler.io"]

  spec.summary       = %q{ Omniauth strategy for Toodledo }
  spec.description   = %q{ Omniauth strategy for Toodledo. This allows you to authenticate to Toodledo from your ruby app. }
  spec.homepage      = 'https://github.com/Mailbutler/omniauth-toodle-oauth2'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1'
  spec.add_runtime_dependency 'omniauth', '~> 1.1', '>= 1.1.1'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.3', '>= 1.3.1'
end
