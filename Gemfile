# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION
# TODO: update Ruby back to 2.6.5+

DECIDIM_VERSION = '0.22.0' #{ git: 'https://github.com/decidim/decidim', branch: 'release/0.22-stable' }

gem "decidim", DECIDIM_VERSION
gem "decidim-cookies", path: "."

gem "bootsnap", "~> 1.3"

gem "puma", "~> 4.3.3"
gem "uglifier", "~> 4.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "faker", "~> 1.9"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end
