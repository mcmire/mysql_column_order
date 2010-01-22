require 'rubygems'

require 'pp'

if ENV["AR_VERSION"]
  gem 'activerecord', "= #{ENV["AR_VERSION"]}"
end
require 'activerecord'
require 'active_record/version'
ActiveRecord::Base.establish_connection(
  "adapter" => "mysql",
  "database" => "in_memory"
)

gem 'mcmire-protest'
require 'protest'
gem 'mcmire-matchy'
require 'matchy'
gem 'mcmire-mocha'
require 'mocha'
gem 'mocha-protest-integration'
require 'mocha-protest-integration'

Protest.report_with :documentation
#Protest::Utils::BacktraceFilter::ESCAPE_PATHS << %r|test/unit| << %r|matchy| << %r|mocha-protest-integration|
Protest::Utils::BacktraceFilter::ESCAPE_PATHS.clear

require 'init'