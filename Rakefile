require 'pp'
require 'hoe'
require './lib/sportdb/market/version.rb'

## NB: plugin (hoe-manifest) not required; just used for future testing/development
Hoe::plugin :manifest   # more options for manifests (in the future; not yet)

###########
#### NB: if you try this script at home
#    you need to create a (symbolic) link to the sport.db-market fixtures
#     e.g. use ln -s ../sport.db-market  data  or similar

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


namespace :dev do
  
  
  ### NB: use rake -I ./lib dev:test      # fresh import (starts w/ clean wipe out)
  ### NB: use rake -I ./lib dev:update    # just update quotes

  BUILD_DIR = "./build"
  
  SPORT_DB_PATH = "#{BUILD_DIR}/sport.db"

  DB_CONFIG = {
    :adapter   =>  'sqlite3',
    :database  =>  SPORT_DB_PATH
  }

  directory BUILD_DIR

  task :clean do
    rm SPORT_DB_PATH if File.exists?( SPORT_DB_PATH )
  end

  task :env => BUILD_DIR do
    require 'sportdb'
    require './lib/sportdb/market.rb'

    pp DB_CONFIG
    ActiveRecord::Base.establish_connection( DB_CONFIG )
  end

  task :create => :env do
    WorldDB.create
    SportDB.create
    SportDB::Market.create
  end
  
  task :import => :env do
    WorldDB.read_all  # populate world tables

    SportDB.load_all
    SportDB.read_all

    SportDB.stats
  end


  desc 'sportdb-market - test loading of builtin fixtures'
  task :test => [:clean, :create, :import] do
    SportDB::Market.load_all
    SportDB::Market.read_all
  end

  desc 'sportdb-market - test loading of builtin fixtures (just update)'
  task :update => :env do
    SportDB::Market.delete!
    SportDB::Market.load_all
    SportDB::Market.read_all
  end


end  # namespace :dev