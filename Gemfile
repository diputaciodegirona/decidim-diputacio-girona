source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/CodiTramuntana/decidim.git", branch: "release/0.27-stable" }.freeze

gem 'decidim', DECIDIM_VERSION
gem 'decidim-initiatives', DECIDIM_VERSION
gem 'decidim-consultations', DECIDIM_VERSION
gem 'decidim-file_authorization_handler', tag: "v0.27.1.4", git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git"
gem 'decidim-verify_wo_registration', '0.1.0'

gem "geocoder"
gem "sassc"
gem "psych", "< 4"

# Needed to fix: NameError: uninitialized constant WickedPdf
gem 'wicked_pdf'

gem 'delayed_job_active_record'
gem 'daemons'
gem "whenever", require: false

gem 'puma-daemon', require: false
gem 'puma', '~> 5.0'
gem 'uglifier', '>= 4.0.0'
gem 'figaro', '>= 1.1.1'

group :development, :test, :staging do
  gem 'byebug', platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem 'faker'
  gem 'bootsnap'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'better_errors', '>= 2.3.0'
  gem 'binding_of_caller'

  gem 'capistrano', '~> 3.17'
  gem "capistrano-rails", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rbenv", require: false
  gem "capistrano3-puma", require: false
  gem "capistrano3-delayed-job", require: false
  gem "ed25519", require: false
  gem "bcrypt_pbkdf", require: false
end

