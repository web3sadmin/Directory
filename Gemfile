source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bundler'
gem 'rails', '7.2.2'
gem 'mysql2', '>= 0.5.6', '< 0.6.0'
gem 'puma', '~> 5.0' # Обновленная версия Puma
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'nokogiri'
gem 'sassc-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'mini_portile2', '~> 2.8', '>= 2.8.7'
gem 'rubyzip', '2.4.rc1'
gem 'bigdecimal'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'devise_ldap_authenticatable'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bcrypt', '~> 3.1.7' # Устаревший bcrypt-ruby заменен на bcrypt
gem 'bootstrap-wysihtml5-rails'
gem 'foundation-icons-sass-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '~> 4.0'
end
