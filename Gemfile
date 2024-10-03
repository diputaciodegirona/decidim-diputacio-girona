source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.28.3"

gem 'decidim', DECIDIM_VERSION
gem 'decidim-initiatives', DECIDIM_VERSION
#gem 'decidim-consultations', "0.27.9"
gem 'decidim-file_authorization_handler', branch: "upgrade/0.28", git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git"
gem 'decidim-verify_wo_registration', '0.3.0'

gem "geocoder"
gem "sassc"
gem "psych", "~> 4"

# Needed to fix: NameError: uninitialized constant WickedPdf
gem 'wicked_pdf'

gem 'delayed_job_active_record'
gem 'daemons'
gem "whenever", require: false

#gem 'puma-daemon','>=0.3.2', require: false
#gem 'puma', '~> 6.3.1'
#gem 'uglifier', '>= 4.0.0'
#gem 'figaro', '>= 1.1.1'
gem "bootsnap", "~> 1.4"

gem "puma", ">= 6.3.1"
gem "capistrano3-puma", '6.0.0.beta.1'


group :development, :test, :staging do
  gem 'byebug', platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem 'faker'
#  gem 'bootsnap'
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

