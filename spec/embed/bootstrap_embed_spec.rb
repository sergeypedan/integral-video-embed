# frozen_string_literal: true

require "spec_helper"

RSpec.describe RSpec.describe Integral::Video::Embed::Html, ".embed_video" do

  subject { Integral::Video::Embed::Html.embed_video(uid, provider: provider, hash: hash, embed_method: embed_method, width: width, height: height, proportions: proportions) }

  let(:embed_method) { :bootstrap }
  let(:hash) { nil }
  let(:height) { nil }
  let(:proportions) { nil }
  let(:provider) { "YouTube" }
  let(:uid) { "123" }
  let(:width) { nil }

  context "embed_method is Bootstrap" do

    context "proportions provided" do
      let(:proportions) { "16by9" }

      it "outputs correct HTML" do
        expect(subject).to eq <<~HEREDOC
                                <div class="embed-responsive embed-responsive-#{proportions}">
                                  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/#{uid}?rel=0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                </div>
                              HEREDOC
      end
    end

    context "proportions not provided" do
      it "raises an exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "proportions provided but incorrect" do
      let(:proportions) { "1by2" }

      it "raises an exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end
  end

end
