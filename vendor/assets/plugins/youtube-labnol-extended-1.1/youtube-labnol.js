(function() {

	// Actions

	function replace_with_iframe_html() {
		var mount_div  = this;
		var video_id   = extract_video_id(mount_div);
		var iframe_src = build_iframe_src(video_id);
		var iframe     = iframe_html_node(iframe_src);
		mount_div.innerHTML = ""; // to delete poster & button
		mount_div.appendChild(iframe);
	}


	// Generators

	function iframe_html_node(iframe_src) {
		if (!iframe_src) { console.warn("No iframe_src"); return null }
		var iframe = document.createElement("iframe");
		iframe.setAttribute("src", iframe_src);
		iframe.setAttribute("frameborder", "0");
		iframe.setAttribute("class", "labnol-iframe");
		return iframe
	}

	function build_iframe_src(video_id) {
		return "https://www.youtube.com/embed/"
						+ video_id
						+ "?" + "autoplay=" + "1"
						+ "&" + "autohide=" + "2"
						+ "&" + "border=" + "0"
						+ "&" + "controls=" + "1"
						+ "&" + "enablejsapi=" + "1"
						+ "&" + "showinfo=" + "0"
						+ "&" + "wmode=" + "opaque"
	}

	function play_button_html(overriding_src) {
		if (!!overriding_src) {
			return "<div class=\"labnol-play-button\" style=\"background-image: url('" + overriding_src + "')\"></div>";
		} else {
			return "<div class=\"labnol-play-button\"></div>";
		}
	}

	function thumbnail_html(video_id) {
		return "<img alt=\"Заставка видео\" class=\"labnol-thumb\" src=\"https://i.ytimg.com/vi/" + video_id + "/maxresdefault.jpg\" loading=\"lazy\">";
	}


	// Finders

	function container_divs() {
		return document.getElementsByClassName("labnol-youtube-player")
	}

	function extract_player_button_src(mount_div) {
		if (mount_div.dataset.buttonSrc) { return mount_div.dataset.buttonSrc }
	}

	function extract_video_id(mount_div) {
		return mount_div.dataset.id
	}


	// Run

	Array.prototype.slice.apply( container_divs() ).forEach(function(mount_div) {
		if (!mount_div) { console.warn("No mount_div"); return null }

		var video_id  = extract_video_id(mount_div);
		if (!video_id) { console.warn("No `video_id` in node", mount_div); return null }

		var thumb_src = extract_player_button_src(mount_div);
		mount_div.innerHTML = thumbnail_html(video_id) + play_button_html(thumb_src);
		mount_div.onclick = replace_with_iframe_html;
	});

})();
