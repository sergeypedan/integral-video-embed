# frozen_string_literal: true

module Integral
  module Video
    module Embed
      module Labnol
        class << self
          def html(uid, thumbnail: nil)
            fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}" if uid.nil? || uid == ""
            thumbnail = nil if thumbnail == ""
            [
              "<div",
              " class=\"labnol__youtube-player\"",
              " data-id=\"#{uid}\"",
             (" data-thumbnail=\"#{thumbnail}\"" if thumbnail),
              "></div>"
            ].reject(&:nil?).join
          end
        end
      end
    end
  end
end
