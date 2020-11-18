# frozen_string_literal: true

module Decidim
  # This module includes helpers to verify the acceptance of the cookie policy
  module CookiesHelper
    # Public: Returns true if the cookie policy has been accepted
    def cookies_accepted?
      cookies["decidim-cc"] = nil if cookies["decidim-cc"].to_s == 'true' # ignore single-value accepted cookies

      cookies["decidim-cc"].present?
    end
  end
end
