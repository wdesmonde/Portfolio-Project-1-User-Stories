source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

# therubyracer provices a JavaScript container
#    this is not needed for Windows
# under Windows, run 
#     bundle install --without not_windows
# under Ubuntu, run
#     bundle install
group :not_windows do
   gem 'therubyracer'
end

gem 'execjs'

gem 'sorcery'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml-rails'
group :development, :test do
  gem "rspec-rails"
  gem "launchy"
  gem "debugger"
  gem "pry-rescue"
  gem "pry-stack_explorer"
  gem "pry-doc"
  gem "pry-debugger"
  gem "runner"
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem "guard-rspec"
end

group :development do
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'html2haml'
  gem "bullet"
end


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
