# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::Video::Provider, "page_url" do

  subject { Integral::Video::Provider.new(name).page_url(uid) }

  let(:uid) { "123" }
  let(:name) { "YouTube" }

  it { is_expected.to eq "https://youtube.com/watch/?v=123" }

end
