require 'hoe'
require './lib/sportdb/market/version.rb'

## NB: plugin (hoe-manifest) not required; just used for future testing/development
Hoe::plugin :manifest   # more options for manifests (in the future; not yet)

Hoe.spec 'sportdb-market' do
  
  self.version = SportDB::Market::VERSION
  
  self.summary = 'sportdb plugin for market quotes (odds, etc)'
  self.description = summary

  self.urls    = ['https://github.com/geraldb/sport.db.ruby-market']
  
  self.author  = 'Gerald Bauer'
  self.email   = 'opensport@googlegroups.com'
    
 
  ## soft deps (dependencies)
  ##   -- sportdb gem must be installed already

  self.licenses = ['Public Domain']

  self.spec_extras = {
    :required_ruby_version => '>= 1.9.2'
  }

end