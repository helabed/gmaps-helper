# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

# Specifies the production version of the google maps api key which is setup for http://rubywebworks.com
GOOGLE_MAPS_API_KEY = 'ABQIAAAATJL7OHV_fwFFKPDFWt53ChQfeJeu0VDWhgU9x2vczpagCv-LBBQdtDFpDxE3DbT9xv75YCMq028USw'

# The following was not needed and it was giving me a warning(??), but it looks like if you have a valid
# production key, then google wouldn't complain about it being used in http://localhost
#if ENV["RAILS_ENV"] != 'production'
#  # Specifies the development/test version of the google maps api key which is setup for http://localhost
#  GOOGLE_MAPS_API_KEY = 'ABQIAAAATJL7OHV_fwFFKPDFWt53ChT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRp-K-fE-a41fLoOHyfZY85x2fgCA'
#end

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

ENV['RAILS_RELATIVE_URL_ROOT']="/maps.rubywebworks.com/current"

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_gmaps-helper_session',
    :secret      => 'c069b2690326887f7b63755b379094e7ed979af65718ce0293d0b0451f7f00bc84da8a04a725befdccc7aacc9e1ac5d2b865bda67fc9178d3f8cd062657800da'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  #As of Rails 2.0, pagination is no longer a part of Rails, instead this functionality
  #is provided by a gem. You can add this gem to an existing application by adding
  #the following to the end of conﬁg/environment.rb.
  #Added by Hani Elabed on 12-31-2008 as suggested by AWDWR_3rd_Ed Page 526.
  # Then, to install this gem (and any other missing gem dependencies), run
  # sudo rake gems:install

  #  config.gem 'mislav-will_paginate' , :version => '~> 2.3.2' ,
  #    :lib => 'will_paginate' , :source => 'http://gems.github.com'
      #
      #UPDATE by Hani Elabed on 12-31-2008 -- 6:20 PM GMT-2 
      # I ended up reverting the above changes because wanted to use the rails plugin instead of ruby gem.
      # To install the will_paginate rails plugin, I typed:
      #
      #     script/plugin install git://github.com/mislav/will_paginate.git
      #
  
end
