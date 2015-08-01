WARBLER_CONFIG = {}


ENV['GEM_HOME'] = File.expand_path('../..', __FILE__)


ENV['BUNDLE_GEMFILE'] = File.expand_path('../../couchbase-lite-local/Gemfile', __FILE__)

$LOAD_PATH.unshift __FILE__.sub(/!.*/, '!/couchbase-lite-local/lib')
require 'rubygems'
ENV['BUNDLE_WITHOUT'] = 'development:test:assets'

