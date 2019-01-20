# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::Video::Provider, "find_by" do

  subject { Integral::Video::Provider.find_by(name: name, uid: uid) }

  let(:name) { nil }
  let(:uid) { nil }

  context "name provided" do
    let(:name) { "YouTube" }
    it { is_expected.to be_a Hash }
  end

  context "uid provided" do
    let(:uid) { "youtube" }
    it { is_expected.to be_a Hash }
  end

  context "nothing provided" do
    it "raises an exception" do
      expect { subject }.to raise_exception ArgumentError
    end
  end

end
