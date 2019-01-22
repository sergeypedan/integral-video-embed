# frozen_string_literal: true

module Integral
  module Video
    module Embed
      module Bootstrap

        PROPORTIONS = ["16by9", "4by3"]

        class << self
          def html(uid, provider:, hash: nil, proportions: "16by9")
            fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}"              if uid.nil? || uid == ""
            fail ArgumentError, "`provider` must be provided, you passed #{provider.inspect}"    if provider.nil? || provider == ""
            fail ArgumentError, "`proportions` must be provided to embed via Bootstrap strategy" if proportions.nil? || proportions == ""
            fail ArgumentError, "`proportions` must be one of #{PROPORTIONS.inspect}" unless PROPORTIONS.include? proportions
            provider_names = Integral::Video::Provider.names
            fail ArgumentError, "Unkown provider '#{provider}'. Supported are: #{provider_names.inspect}" unless provider_names.include? provider

            src = Integral::Video::Provider.new(provider).iframe_src(uid, hash)
            fail StandardError, "`Integral::Video::Provider` error: `iframe_src` could not be calculated when it must be. Seems like you will have to manually correct this gem's code. Such is open source." unless src

            <<~HEREDOC
              <div class="embed-responsive embed-responsive-#{proportions}">
                <iframe class="embed-responsive-item" src="#{src}" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
              </div>
            HEREDOC
          end
        end
      end
    end
  end
end
