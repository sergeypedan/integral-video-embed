# Integral Video Embed

[![Gem Version](https://badge.fury.io/rb/integral-video-embed.svg)](http://badge.fury.io/rb/integral-video-embed)

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

Probably, within a Rails helper:

```ruby
def embed_youtube(uid)
  Integral::Video::Embed::Html.embed_video(uid, provider: "YouTube", embed_method: :bootstrap, proportions: "16by9").html_safe
end

def embed_vk(uid, hash:)
  Integral::Video::Embed::Html.embed_video(uid, provider: "Вконтакте").html_safe
end
```

and within a Rails view:

```slim
<%= embed_youtube(@video.uid) %>
<%= embed_vk(@video.uid, @video.uhash) %>
```

## Tests

To test, run:

    bundle exec rake

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

Copyright 2019 [Integral Design](http://integral-design.ru).
Read [LICENSE](LICENSE.md) for details.

## History

Read [CHANGES](CHANGES.md) for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).

## Credits

Developed by [Sergey Pedan]() at
[Integral Design](http://integral-design.ru).
