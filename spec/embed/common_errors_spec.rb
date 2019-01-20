# frozen_string_literal: true

require "spec_helper"

RSpec.describe RSpec.describe Integral::Video::Embed::Html, ".embed_video" do

  subject { Integral::Video::Embed::Html.embed_video(uid, provider: provider, hash: hash, embed_method: embed_method, width: width, height: height, proportions: proportions) }

  let(:embed_method) { nil }
  let(:hash) { nil }
  let(:height) { 400 }
  let(:proportions) { nil }
  let(:provider) { "YouTube" }
  let(:uid) { "123" }
  let(:width) { 600 }

  context "uid not provided" do
    let(:uid) { nil }

    it "raises an exception" do
      expect { subject }.to raise_exception ArgumentError
    end
  end

  context "provider not provided" do
    let(:provider) { nil }

    it "raises an exception" do
      expect { subject }.to raise_exception ArgumentError
    end
  end

end
