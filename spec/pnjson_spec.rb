require 'spec_helper'

describe Pnjson do
  it "should have a VERSION constant" do
    expect(Pnjson.const_defined?('VERSION')).to eql true
  end
end

describe Pnjson::Pnjson do
  let(:png_file) { Pnjson::Pnjson.new(fixture_file("test.png")) }

  describe '#initialize' do
    context "invalid png" do
      let(:filename) { fixture_file("test.txt") }

      it "raises InvalidPng exception" do
        expect { Pnjson::Pnjson.new(filename) }.to raise_error(Pnjson::Error::InvalidPng)
      end
    end

    context "valid png" do
      let(:filename) { fixture_file("test.png") }

      it "returns valid instance of Pnjson::Pnjson" do
        expect { Pnjson::Pnjson.new(filename) }.not_to raise_error
      end
    end
  end

  describe '#valid_png' do
    subject { png_file.valid_png?(hash) }
    context "invalid png" do
      let(:hash) { [ "af", "ae"] }
      it "returns false if file invalid" do
        is_expected.to eq false
      end
    end

    context "valid png" do
      let(:hash) { [ "89", "50", "4e", "47", "0d", "0a", "1a", "0a"] }
      it "returns true if file valid" do
        is_expected.to eq true
      end
    end
  end
end
