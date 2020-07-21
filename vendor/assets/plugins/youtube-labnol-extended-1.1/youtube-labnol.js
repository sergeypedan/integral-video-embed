(function() {

  // Actions

  function replace_with_iframe_html() {
    var mount_div  = this
    var video_id   = extract_video_id(mount_div)
    var iframe_src = build_iframe_src(video_id)
    var iframe     = iframe_html_node(iframe_src)
    mount_div.innerHTML = null // to delete poster & button
    mount_div.appendChild(iframe)
  }


  // Generators

  function iframe_html_node(iframe_src) {
    if (!iframe_src) { console.warn("No iframe_src"); return null }
    var iframe = document.createElement("iframe")
    iframe.src = iframe_src
    iframe.frameborder = 0
    iframe.classList.add("labnol-iframe")
    return iframe
  }

  function build_iframe_src(video_id) {
    var url    = new URL("https://www.youtube.com/embed/")
    var params = new URLSearchParams()
    params.append("autoplay",    1)
    params.append("autohide",    2)
    params.append("border",      0)
    params.append("controls",    1)
    params.append("enablejsapi", 1)
    params.append("showinfo",    0)
    params.append("wmode", "opaque")
    url.search   = params
    url.pathname = "/embed/" + video_id
    return url.href
  }

  function play_button_HTML(overriding_src) {
    var div = document.createElement("div")
    div.classList.add("labnol-play-button")
    if (overriding_src) div.style.backgroundImage = "url(" + overriding_src + ")"
    return div.outerHTML
  }

  function thumbnail_URL_from_video_id(video_id) {
    return "https://i.ytimg.com/vi/" + video_id + "/maxresdefault.jpg"
  }

  function thumbnail_url(video_id, custom_URL) {
    return custom_URL || thumbnail_URL_from_video_id(video_id)
  }

  function thumbnail_html(video_id, custom_URL) {
    var img = document.createElement("img")
    img.alt = "Заставка видео"
    img.src = thumbnail_url(video_id, custom_URL)
    img.loading = "lazy"
    img.classList.add("labnol-thumb")
    return img.outerHTML
  }


  // Finders

  function container_divs() {
    return document.getElementsByClassName("labnol-youtube-player")
  }

  function extract_video_id(mount_div) {
    return mount_div.dataset.id
  }


  // Run

  Array.from(container_divs()).forEach(function(mount_div) {
    if (!mount_div) { console.warn("No mount_div"); return null }

    var video_id  = extract_video_id(mount_div)
    if (!video_id) { console.warn("No `video_id` in node", mount_div); return null }

    var custom_thumbnail_URL = mount_div.dataset.thumbnail || null
    var button_URL           = mount_div.dataset.buttonSrc || null

    mount_div.innerHTML = thumbnail_html(video_id, custom_thumbnail_URL) + play_button_HTML(button_URL)
    mount_div.onclick   = replace_with_iframe_html
  })

})();
