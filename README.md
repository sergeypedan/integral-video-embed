# Integral Video Embed

[![Gem Version](https://badge.fury.io/rb/integral-video-embed.svg)](https://badge.fury.io/rb/integral-video-embed)

<!-- Tocer[start]: Auto-generated, don't remove. -->

## Table of Contents

  - [Features](#features)
  - [Screencasts](#screencasts)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Tests](#tests)
  - [Versioning](#versioning)
  - [Code of Conduct](#code-of-conduct)
  - [Contributions](#contributions)
  - [License](#license)
  - [History](#history)
  - [Credits](#credits)

<!-- Tocer[finish]: Auto-generated, don't remove. -->

## Features

Helps embed videos from known providers like YouTube into HTML

## Requirements

1. [Ruby 2.5.0+](https://www.ruby-lang.org)

## Setup

To install, run:

    gem install integral-video-embed

Add the following to your Gemfile:

    gem "integral-video-embed"

## Usage

1. Probably, within a Rails helper:

    ```ruby
    def bootstrap_embed(uid)
      Integral::Video::Embed::Bootstrap.html(uid, provider: "YouTube", proportions: "16by9").html_safe
    end

    def embed_vk(uid, hash:)
      Integral::Video::Embed::Generic.html(uid, provider: "Вконтакте").html_safe
    end
    ```

1. and within a Rails view:

    ```slim
    <%= embed_youtube(@video.uid) %>
    <%= embed_vk(@video.uid, @video.uhash) %>
    ```

### Labnol embed

This is [a very cool technique](https://www.labnol.org/internet/light-youtube-embeds/27941/) by [Amit Agarwal](https://www.labnol.org/about/) that allows not to download the YouTube player with its whole bunch of resources for each embedded video — untill the user clicks on it — but instead show a lightweight proxy of a YouTube player (a poster and a button) that looks almost the same as the player.

To use Labnol embed you have to bring CSS / JS dependency. I improved the original code a little and put it right into the gem folder.

1. Copy & paste `vendor/assets/plugins/youtube-labnol-extended-1.1` folder into you Rails `/vendor/assets/plugins` folder.

1. To include `plugins` folder add it to `assets.rb`:

    ```ruby
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'plugins')
    ```

1. Make button image (`button.svg`) publicly accessible with help of `app/assets/config/manifest.js`

    ```js
    // link ../../../vendor/assets/plugins/youtube-labnol-extended-1.1/button.svg
    ```

And then as usual:

1. within a Rails helper:

    ```ruby
    def embed_labnol(uid)
      Integral::Video::Embed::Labnol.html(uid, provider: "Вконтакте").html_safe
    end
    ```

1. and within a Rails view:

    ```slim
    <%= embed_labnol(@video.uid) %>
    ```

## Tests

To test, run:

```sh
bundle exec rake
```

## Versioning

Read [Semantic Versioning](https://semver.org) for details. Briefly, it means:

- Major (X.y.z) - Incremented for any backwards incompatible public API changes.
- Minor (x.Y.z) - Incremented for new, backwards compatible, public API enhancements/fixes.
- Patch (x.y.Z) - Incremented for small, backwards compatible, bug fixes.

## Code of Conduct

Please note that this project is released with a [CODE OF CONDUCT](CODE_OF_CONDUCT.md). By
participating in this project you agree to abide by its terms.

## Contributions

Read [CONTRIBUTING](CONTRIBUTING.md) for details.

## License

Copyright 2019 [Integral Design](https://integral-design.ru).
Read [LICENSE](LICENSE.md) for details.

## History

Read [CHANGES](CHANGES.md) for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).

## Credits

Developed by [Sergey Pedan]() at
[Integral Design](https://integral-design.ru).
