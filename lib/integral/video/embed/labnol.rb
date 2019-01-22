# frozen_string_literal: true

module Integral
  module Video
    module Embed
      module Labnol
        class << self
          def html(uid)
            fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}" if uid.nil? || uid == ""
            <<~HEREDOC
              <div class="labnol-youtube-player" data-id="#{uid}"></div>
            HEREDOC
          end
        end
      end
    end
  end
end
