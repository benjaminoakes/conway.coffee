source :rubygems

group :development, :test do
  gem 'guard', '~> 0.8.8'
  gem 'guard-shell', '~> 0.1.1'

  if RUBY_PLATFORM.match(/darwin/)
    gem 'rb-fsevent', '~> 0.4.3.1', :require => false
  elsif RUBY_PLATFORM.match(/linux/)
    gem 'rb-inotify', :require => false
  # elsif Windows
  #   gem 'rb-fchange', :require => false
  end
end
