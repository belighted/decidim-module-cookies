# frozen_string_literal: true

require "active_support/concern"

module Cookies
  module SanitizeHelperExtend
    extend ActiveSupport::Concern

    included do

      def decidim_sanitize(_html, options = {})
        html = remove_youtube_iframes(_html)

        if options[:strip_tags]
          strip_tags sanitize(html, scrubber: Decidim::UserInputScrubber.new)
        else
          sanitize(html, scrubber: Decidim::UserInputScrubber.new)
        end
      end

      private

      def remove_youtube_iframes(html)
        c = JSON.parse(cookies['decidim-cc']).try(:[], 'youtube') rescue nil
        return html if c

        if html.include?('<iframe') && html.include?('youtube')
          doc = Nokogiri::HTML(html)
          doc.css('iframe').each do |el|
            if el['src'] =~ %r{(youtube).*?([^/]+)$}i
              el.remove
            end
          end
          doc.at('body').inner_html
        else
          html
        end
      end

    end
  end

  ::Decidim::SanitizeHelper.send(:include, SanitizeHelperExtend)
end