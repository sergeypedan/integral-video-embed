# frozen_string_literal: true

module Integral
  module Video
    module Embed
      module Html

        PROPORTIONS = ["16by9", "4by3"]

        class << self

          def embed_video(uid, provider:, hash: nil, embed_method: :bootstrap, width: nil, height: nil, proportions: "16by9")
            fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}"           if uid.nil? || uid == ""
            fail ArgumentError, "`provider` must be provided, you passed #{provider.inspect}" if provider.nil? || provider == ""
            provider_names = Integral::Video::Provider.names
            fail ArgumentError, "Unkown provider '#{provider}'. Supported are: #{provider_names.inspect}" unless provider_names.include? provider

            src = Integral::Video::Provider.new(provider).iframe_src(uid, hash)
            fail StandardError, "`Integral::Video::Provider` error: `iframe_src` could not be calculated when it must be. Seems like you will have to manually correct this gem's code. Such is open source." unless src

            if embed_method == :bootstrap
              bootstrap_embed_html(src, proportions)
            else
              generic_embed_html(src, width, height)
            end
          end

          private

          def bootstrap_embed_html(src, proportions)
            fail ArgumentError, "`proportions` must be provided to embed via Bootstrap strategy" unless PROPORTIONS.include? proportions
            <<~HEREDOC
              "<div class=\"embed-responsive embed-responsive-#{proportions}\">"
                "<iframe class=\"embed-responsive-item\" src=\"#{src}\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"
              "</div>"
            HEREDOC
          end

          def generic_embed_html(src, width, height)
            fail ArgumentError,  "`width` must be an Integer for generic embed strategy" unless width.is_a?  Integer
            fail ArgumentError, "`height` must be an Integer for generic embed strategy" unless height.is_a? Integer
            "<iframe width=\"#{width}\" height=\"#{height}\" src=\"#{src}\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"
          end
        end

      end
    end
  end
end
