source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION= '~> 0.15.1'


gem 'decidim', DECIDIM_VERSION
gem 'decidim-initiatives', DECIDIM_VERSION
gem 'decidim-consultations', DECIDIM_VERSION
# gem 'decidim', git: "git@github.com:decidim/decidim.git", branch: "0.15-stable"
# gem 'decidim-initiatives', git: "git@github.com:decidim/decidim.git", branch: "0.15-stable"
# gem 'decidim-consultations', git: "git@github.com:decidim/decidim.git", branch: "0.15-stable"
gem 'decidim-file_authorization_handler', git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git", ref: "41de957cc4b5c2eab8b8f606b417ecef09e3d1b8"
## Start force versions Gem
gem 'graphiql-rails', '1.4.11'
gem 'graphql', '1.8.10'
## End force versions Gem

gem 'delayed_job_active_record'
gem 'daemons'

gem 'puma', '~> 3.0'
gem 'uglifier', '>= 4.0.0'
gem 'figaro', '>= 1.1.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  # gem "decidim-dev", git: "git@github.com:decidim/decidim.git", branch: "0.14-stable"
  # gem 'faker', "~> 1.8.4"
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web', '~> 1.3.0'

  gem 'better_errors', '>= 2.3.0'
  gem 'binding_of_caller'
end
