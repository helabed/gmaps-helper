	#set :application, "set your application name here"
	#set :repository,  "set your repository location here"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

	#role :app, "your app-server here"
	#role :web, "your web-server here"
	#role :db,  "your db-server here", :primary => true




#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
# be sure to change these
set :user, 'rubywebw'
set :domain, 'maps.rubywebworks.com'
set :application, 'gmaps-helper'
set :github_user, 'helabed'
set :github_domain, 'github.com'

# file paths
# The following repository setting would have worked if I had a git
# repository created on the same production machine as described in
# Agile Web Dev. With Rails 3rd Edition pages 664-668. 
	#set :repository,  "#{user}@#{domain}:git/#{application}.git" 
# I will be using GitHub and my public clone URL is
# git clone git://github.com/helabed/gmaps-helper.git 
# So I need my :repository to look something like 
# set ;repository "git@github.com:helabed/gmaps-helper.git"
set :repository,  "git@#{github_domain}:#{github_user}/#{application}.git" 
set :deploy_to, "/home/#{user}/#{domain}" 

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

# you might need to set this if you aren't seeing password prompts
# default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['PATH']='/home/rubywebw/bin:/usr/local/bin:/usr/bin:/bin'

# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'
# default_environment['GEM_HOME']='/home/rubywebw/.gem'
# default_environment['GEM_PATH']='/home/rubywebw/.gem:/usr/lib/ruby/gems/1.8'

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

# task which causes Passenger to initiate a restart
#namespace :deploy do
#  task :restart do
#    run "touch #{current_path}/tmp/restart.txt" 
#  end
#end

# task which is the equivalent of a Mongrel restart by is designated
# for a site5 restart - i.e kill all dispatch.fcgi processess.
namespace :deploy do
  task :restart do
    run  "pkill -U #{user} dispatch.fcgi" 
  end
end

# optional task to reconfigure databases.yml by simlinking it
after "deploy:update_code", :symlink_database_yml
desc "symbolically link shared_config/database.yml into the current release path"
task :symlink_database_yml, :roles => :app do
  db_config = "#{deploy_to}/shared_config/database.yml"
  run "ln -nsf #{db_config} #{release_path}/config/database.yml"
end

# optional task to reconfigure development.sqlite3 by simlinking it
after "deploy:update_code", :symlink_development_sqlite3
desc "symbolically link shared_db/development.sqlite3 into the current release path"
task :symlink_development_sqlite3, :roles => :app do
  db_dev_file = "#{deploy_to}/shared_db/development.sqlite3"
  run "ln -nsf #{db_dev_file} #{release_path}/db/development.sqlite3"
end


# optional task to reconfigure production.sqlite3 by simlinking it
after "deploy:update_code", :symlink_production_sqlite3
desc "symbolically link shared_db/production.sqlite3 into the current release path"
task :symlink_production_sqlite3, :roles => :app do
  db_prod_file = "#{deploy_to}/shared_db/production.sqlite3"
  run "ln -nsf #{db_prod_file} #{release_path}/db/production.sqlite3"
end


# REQUIRED Task to deal with ISSUES with SITE 5
after "deploy:symlink", :deal_with_site5_issues
desc "deal with SITE5 issues -- had to copy the new release as release_BUP, then rm original then copy it back as release. maybe some ownership issues."
task :deal_with_site5_issues, :roles => :app do
  run "cp -r  #{release_path} #{release_path}_BUP"
  run "rm -rf #{release_path}"
  run "cp -r  #{release_path}_BUP #{release_path}"
  # now to cleanup, remove the *_BUP directory
  run "rm -rf #{release_path}_BUP"
end


