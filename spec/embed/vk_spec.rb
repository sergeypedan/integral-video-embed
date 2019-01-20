# frozen_string_literal: true

require "spec_helper"

RSpec.describe RSpec.describe Integral::Video::Embed::Html, ".embed_video" do

  subject { Integral::Video::Embed::Html.embed_video(uid, provider: provider, hash: hash, embed_method: embed_method, width: width, height: height, proportions: proportions) }

  let(:embed_method) { nil }
  let(:hash) { "12345" }
  let(:height) { 400 }
  let(:proportions) { nil }
  let(:provider) { "Вконтакте" }
  let(:uid) { "123_456" }
  let(:width) { 600 }

  context "provider is Вконтакте" do

    context "uid does not contain underscore" do
      let(:uid) { "123" }

      it "raises an exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "hash not provided" do
      let(:hash) { nil }

      it "raises an exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "all arguments are good" do
      it "outputs correct HTML" do
        oid, id = uid.split("_")
        expect(subject).to eq <<~HEREDOC
                                <iframe width="#{width}" height="#{height}" src="https://vk.com/video_ext.php?oid=#{oid}&id=#{id}&hash=#{hash}&hd=2" frameborder="0" allow="autoplay; encrypted-media" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                              HEREDOC
      end
    end
  end

end
