# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::Video::Provider, "poster_url" do

  let(:uid) { "123" }

  context "for VK" do
    subject { Integral::Video::Provider.new(name).iframe_src(uid, hash) }

    let(:name) { "Вконтакте" }
    let(:hash) { "789" }

    context "uid is malformed" do
      it "raises an exception" do  expect { subject }.to raise_exception ArgumentError end
    end

    context "uid is valid" do
      let(:uid) { "123_456" }
      it { is_expected.to eq "https://vk.com/video_ext.php?oid=123&id=456&hash=789&hd=2" }
    end

  end

  context "for all but VK" do
    subject { Integral::Video::Provider.new(name).iframe_src(uid) }

    let(:name) { "YouTube" }
    it { is_expected.to eq "https://www.youtube.com/embed/123?rel=0" }
  end


end
