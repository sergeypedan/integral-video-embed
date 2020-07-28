# frozen_string_literal: true

module Integral
  module Video
    module Embed
      # Gem identity information.
      module Identity
        def self.name
          "integral-video-embed"
        end

        def self.label
          "Integral Video Embed"
        end

        def self.version
          "0.1.10"
        end

        def self.version_label
          "#{label} #{version}"
        end
      end
    end
  end
end
