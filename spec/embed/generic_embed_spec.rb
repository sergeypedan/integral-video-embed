# frozen_string_literal: true

require "spec_helper"

RSpec.describe RSpec.describe Integral::Video::Embed::Html, ".embed_video" do

  subject { Integral::Video::Embed::Html.embed_video(uid, provider: provider, hash: hash, embed_method: embed_method, width: width, height: height, proportions: proportions) }

  let(:embed_method) { nil }
  let(:hash) { nil }
  let(:height) { nil }
  let(:proportions) { nil }
  let(:provider) { "YouTube" }
  let(:uid) { "123" }
  let(:width) { nil }

  context "embed_method is generic" do

    context "width not provided" do
      let(:height) { 400 }
      it "raises an exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "height not provided" do
      let(:width) { 600 }
      it "raises an exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "width & height are provided" do
      let(:height) { 400 }
      let(:width) { 600 }

      it "outputs correct HTML" do
        expect(subject).to eq <<~HEREDOC
                                <iframe width="#{width}" height="#{height}" src="https://www.youtube.com/embed/#{uid}?rel=0" frameborder="0" allow="autoplay; encrypted-media" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                              HEREDOC
      end
    end
  end

end
