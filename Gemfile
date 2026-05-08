# frozen_string_literal: true

source 'https://rubygems.org'

ruby RUBY_VERSION

DECIDIM_VERSION = { git: 'https://github.com/CodiTramuntana/decidim.git', branch: 'release/0.30-stable' }.freeze

gem 'decidim', DECIDIM_VERSION
gem 'decidim-file_authorization_handler',
    git: 'https://github.com/CodiTramuntana/decidim-file_authorization_handler.git'
gem 'decidim-initiatives', DECIDIM_VERSION
gem 'decidim-cdtb', '~> 0.5.5'

gem 'geocoder'
gem 'sassc'

# Needed to fix: NameError: uninitialized constant WickedPdf
gem 'wicked_pdf'

gem 'daemons'
gem 'delayed_job_active_record'
gem 'whenever', require: false

gem 'figjam', '~> 2.0.1'
gem 'puma', '~> 6.6.1'
gem 'puma-daemon', '~> 0.5.0', require: false
gem 'uglifier', '>= 4.0.0'

group :development, :test, :staging do
  gem 'bootsnap'
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
  gem 'faker'
end

group :development do
  gem 'bcrypt_pbkdf', require: false
  gem 'capistrano', '~> 3.17'
  gem 'capistrano3-delayed-job', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'ed25519', require: false
end
