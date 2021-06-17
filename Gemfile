source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "~> 0.24.0"

gem 'decidim', DECIDIM_VERSION
gem 'decidim-initiatives', DECIDIM_VERSION
gem 'decidim-consultations', DECIDIM_VERSION
gem 'decidim-file_authorization_handler', git: "https://github.com/MarsBased/decidim-file_authorization_handler.git"
gem 'decidim-verify_wo_registration', git: "https://github.com/CodiTramuntana/decidim-verify_wo_registration.git"

gem "geocoder", "~> 1.6.1"

# Needed to fix: NameError: uninitialized constant WickedPdf
gem 'wicked_pdf'

gem 'delayed_job_active_record'
gem 'daemons'
gem "whenever", require: false

gem 'puma', '~> 4.3'
gem 'uglifier', '>= 4.0.0'
gem 'figaro', '>= 1.1.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem 'faker', "~> 1.9"
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web', '~> 1.3.0'

  gem 'better_errors', '>= 2.3.0'
  gem 'binding_of_caller'

  gem "capistrano", "3.11.0", require: false
  gem "capistrano-rails", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rbenv", require: false
  gem "capistrano3-puma", require: false
  gem "capistrano3-delayed-job", require: false
  gem "ed25519", require: false
  gem "bcrypt_pbkdf", require: false
end

