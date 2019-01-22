# frozen_string_literal: true

module Integral
  module Video
    module Embed
      module Generic
        class << self
          def html(uid, provider:, hash: nil, width: nil, height: nil)
            fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}"           if uid.nil? || uid == ""
            fail ArgumentError, "`provider` must be provided, you passed #{provider.inspect}" if provider.nil? || provider == ""
            provider_names = Integral::Video::Provider.names
            fail ArgumentError, "Unkown provider '#{provider}'. Supported are: #{provider_names.inspect}" unless provider_names.include? provider

            src = Integral::Video::Provider.new(provider).iframe_src(uid, hash)
            fail StandardError, "`Integral::Video::Provider` error: `iframe_src` could not be calculated when it must be. Seems like you will have to manually correct this gem's code. Such is open source." unless src

            fail ArgumentError,  "`width` must be an Integer for generic embed strategy" unless width.is_a?  Integer
            fail ArgumentError, "`height` must be an Integer for generic embed strategy" unless height.is_a? Integer
            <<~HEREDOC
              <iframe width="#{width}" height="#{height}" src="#{src}" frameborder="0" allow="autoplay; encrypted-media" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
            HEREDOC
          end
        end
      end
    end
  end
end
