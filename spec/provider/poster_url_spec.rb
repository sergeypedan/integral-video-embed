# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::Video::Provider, "poster_url" do

  subject { Integral::Video::Provider.new(name).poster_url(uid) }

  let(:uid) { "123" }

  context "poster_url exists" do
    let(:name) { "YouTube" }
    it { is_expected.to eq "http://i.ytimg.com/vi/123/hqdefault.jpg" }
  end

  context "poster_url does not exist" do
    let(:name) { "Vimeo" }
    it { is_expected.to be_nil }
  end


end
