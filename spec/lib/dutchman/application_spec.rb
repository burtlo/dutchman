require 'spec_helper'

describe Dutchman::Application do

  subject { described_class.new(name: "Chrome") }

  it "has a name" do
    expect(subject.name).to eq("Chrome")
  end

  describe "#write" do
    context "when given a body of text" do
      it "writes the text to the application" do
        expect(subject).to receive(:_write).with("Chrome","All your roommates know my voice!",:moderate)
        subject.write("All your roommates know my voice!")
      end
    end

    context "when no text is provided" do

    end
  end

end