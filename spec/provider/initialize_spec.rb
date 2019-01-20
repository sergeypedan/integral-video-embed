# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::Video::Provider, "find_by" do

  subject { Integral::Video::Provider.new(name) }

  context "name provided" do
    let(:name) { "YouTube" }
    it { is_expected.to be_a Integral::Video::Provider }
  end

  context "name not provided" do
    let(:name) { nil }
    it "raises an exception" do
      expect { subject }.to raise_exception ArgumentError
    end
  end

end
