source 'https://rubygems.org'

gem 'rails', '4.0.0'

gem 'activerecord-deprecated_finders',
  git: 'git://github.com/rails/activerecord-deprecated_finders.git'

# Bundle edge Rails instead:
#gem 'rails', :git => 'git://github.com/rails/rails.git'
#gem 'journey', git: 'git://github.com/rails/journey.git'

gem 'active_decorator'

gem 'sqlite3'
#group :development, :test do
#  gem 'sqlite3'
#end
#group :production do
#  gem 'pg'
#end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
#  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails', github: 'anjlab/bootstrap-rails'
gem 'bootstrap-generators', '~> 3.0'

group :test, :development do
  gem 'rspec-rails'
#  gem 'debugger'
  gem 'ir_b'
end

#  gem 'sass-rails',   '~> 3.2.3'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
