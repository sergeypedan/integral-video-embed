# frozen_string_literal: true

module Integral
	module Video
		class Provider

			DB = [
				{
					color:      "#e60000",
					embed_url:  "https://www.youtube.com/embed/${uid}?rel=0",
					fa_icon:    "youtube",
					name:       "YouTube",
					page_url:   "https://youtube.com/watch/?v=${uid}",
					poster_url: "http://i.ytimg.com/vi/${uid}/hqdefault.jpg",
					uid:        "youtube"
				}, {
					color:      "#00ADEF",
					embed_url:  "https://player.vimeo.com/video/${uid}",
					fa_icon:    "vimeo-square",
					name:       "Vimeo",
					page_url:   "https://vimeo.com/${uid}",
					poster_url:  nil,
					uid:        "vimeo"
				}, {
					color:      "#45668e",
					embed_url:  "https://vk.com/video_ext.php?oid=${oid}&id=${id}&hash=${hash}&hd=2",
					fa_icon:    "vk",
					name:       "Вконтакте",
					page_url:   "https://vk.com/video${uid}",
					poster_url:  nil,
					uid:        "vkontakte"
				}
			].freeze


			# Methods

			def initialize(name)
				fail ArgumentError, "`Provider name` must be provided" if name.nil? || name == ""
				self.class.find_by(name: name) || fail(ArgumentError, "Provider `name` not supported. Currently supported: #{self.class.names.join(", ")}")
				@name = name
			end


			def iframe_src(uid, hash=nil)
				validate_uid! uid

				if @name == "Вконтакте"
					fail ArgumentError, "`uid` you provided (#{uid.inspect}) is not a valid VK UID" unless uid.include? "_"
					fail ArgumentError, "`hash` must be provided for videos from VK, you passed #{hash.inspect}" if hash.nil? || hash == ""
					oid, id = uid.split("_")
					provider_hash[:embed_url].sub("${id}", id).sub("${oid}", oid).sub("${hash}", hash)
				else
					provider_hash[:embed_url].sub("${uid}", uid)
				end
			end


			def fa_icon_id
				provider_hash[:fa_icon]
			end


			def fa_icon
				"<span class=\"fa fa-#{fa_icon_id}\" style=\"color: #{provider_hash[:color]}\"></span>".html_safe
			end


			def page_url(uid)
				validate_uid! uid
				return unless provider_hash[:page_url]
				provider_hash[:page_url].sub("${uid}", uid)
			end


			def poster_url(uid)
				validate_uid! uid
				return unless provider_hash[:poster_url]
				provider_hash[:poster_url].sub("${uid}", uid)
			end


			private


			def provider_hash
				self.class.find_by(name: @name)
			end


			def validate_uid!(uid)
				fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}" if uid.nil? || uid == ""
			end


			# Class methods

			class << self

				def all
					DB
				end

				def for_select
					DB.map { |hash| [ hash[:name], hash[:name] ] }
				end

				def find_by(name: nil, uid: nil)
					fail ArgumentError, "Either `name` or `uid` must be provided" if [name, uid].all?(&:nil?)
					return DB.select { |hash| hash[:name] == name }.first unless uid
					return DB.select { |hash| hash[:uid]  == uid  }.first unless name
				end

				def names
					DB.map { |hash| hash[:name] }
				end

			end

		end
	end
end
