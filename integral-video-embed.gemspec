# frozen_string_literal: true

$LOAD_PATH.append File.expand_path("lib", __dir__)
require "integral/video/embed/identity"

Gem::Specification.new do |spec|
  spec.name = Integral::Video::Embed::Identity.name
  spec.version = Integral::Video::Embed::Identity.version
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Sergey Pedan"]
  spec.email = ["sergey.pedan@gmail.com"]
  spec.homepage = "https://github.com/sergeypedan/integral-video-embed"
  spec.summary = "Helps embed video from known providers"
  spec.license = "MIT"

  spec.metadata = {
    "source_code_uri" => "https://github.com/sergeypedan/integral-video-embed",
    "changelog_uri"   => "https://github.com/sergeypedan/integral-video-embed/blob/master/CHANGES.md",
    "bug_tracker_uri" => "https://github.com/sergeypedan/integral-video-embed/issues"
  }


  spec.required_ruby_version = ">= 2.5"
  spec.add_development_dependency "bundler-audit"
  spec.add_development_dependency "gemsmith"
  spec.add_development_dependency "git-cop"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "reek"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"

  spec.files = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.require_paths = ["lib"]
end
