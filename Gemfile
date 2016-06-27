source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use PostgreSQL for production
gem 'pg'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'awesome_print'
gem 'jsonapi-resources'
gem 'rack-cors', :require => 'rack/cors'

# For auth0
gem 'knock', '~> 1.4.2'

# For image attachment
gem 'paperclip', '~> 5.0.0.beta1'
# For managing AWS resources through paperclip
gem 'aws-sdk', '~> 2.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry'
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
