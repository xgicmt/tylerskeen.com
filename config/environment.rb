# Load the Rails application.
require File.expand_path('../application', __FILE__)


if ENV["RACK_ENV"] == "production"
  ENV['GEM_PATH'] = File.expand_path('home/christhompson/.rvm/wrappers/ruby-2.2.2/ruby')
end

#if ENV['RAILS_ENV'] == 'production'  # don't bother on dev
#  ENV['GEM_PATH'] = '/home/christhompson/.gems' #+ ':/usr/lib/ruby/gems/1.8'  # Need this or Passenger fails to start
#end
# Initialize the Rails application.
Rails.application.initialize!
