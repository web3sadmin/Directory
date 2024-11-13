source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Install manager dependencies
gem 'bundler'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '7.2.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.5.6', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# See https://rubygems.org/gems/nokogiri/versions/1.16.7
gem 'nokogiri'

gem 'sassc-rails'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'mini_portile2', '~> 2.8', '>= 2.8.7'

gem 'rubyzip', '2.4.rc1'

gem 'bigdecimal'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  #gem 'web-console', '~> 4.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', group: :development
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "devise"
gem "devise_ldap_authenticatable"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bcrypt-ruby', '3.0.0', :require => 'bcrypt'
gem 'bootstrap-wysihtml5-rails'
gem 'foundation-icons-sass-rails'
