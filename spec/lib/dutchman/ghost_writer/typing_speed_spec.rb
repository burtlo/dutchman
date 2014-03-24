require "spec_helper"

describe Dutchman::GhostWriter::TypingSpeed do

  context "when slow" do

    subject { described_class.new(:slow,false) }

    it "has the correct delay between characters" do
      expect(subject.delay_between_characters).to eq(0.26)
    end

  end

  context "when moderate" do

    subject { described_class.new(:moderate,false) }

    it "has the correct delay between characters" do
      expect(subject.delay_between_characters).to eq(0.17)
    end
  end

  context "when fast" do

    subject { described_class.new(:fast,false) }

    it "has the correct delay between characters" do
      expect(subject.delay_between_characters).to eq(0.12)
    end
  end

  context "when humanized" do

    subject { described_class.new(:fast,true) }

    it "has the correct delay between characters" do
      subject.stub(:random_number_between_pos_and_neg) { 0.01 }
      expect(subject.delay_between_characters).to eq(0.13)
    end

  end

end