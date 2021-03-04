# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Cookies
    # This is the engine that runs on the public interface of cookies.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Cookies

      routes do
        # Add engine routes here
        # resources :cookies
        # root to: "cookies#index"
      end

      initializer "decidim_cookies.assets" do |app|
        app.config.assets.precompile += %w(decidim_cookies_manifest.js decidim_cookies_manifest.css)
      end

      initializer "decidim_cookies.extends" do
        Dir.glob("#{Decidim::Cookies::Engine.root}/lib/extends/cookies/**/*.rb").each do |override|
          require_dependency override
        end
      end

    end
  end
end
