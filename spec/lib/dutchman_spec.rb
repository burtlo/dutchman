require 'spec_helper'

describe Dutchman do

  describe ".write" do

    subject { described_class }

    context "when an application and text are specified" do
      it "writes the text to the specified application at the default speed" do
        expect(subject).to receive(:_write).with(application: "Sublime Text",
          text: "I want fruit roll ups!",
          speed: :moderate,
          humanize: false)
        subject.write(to: "Sublime Text", text: "I want fruit roll ups!")
      end
    end

    context "when the speed is provided" do
      it "writes all the text out to the application at the specified speed" do
        expect(subject).to receive(:_write).with(application: "Sublime Text",
          text: "Put your groceries in my cart tonight",
          speed: :slow,
          humanize: false)
        subject.write(to: "Sublime Text", text: "Put your groceries in my cart tonight", speed: :slow)
      end
    end

    context "when an application is not specified" do
      it "tells the user an error has occurred"
    end

    context "when text is not specified" do
      it "tells the user that no text was specified"
    end
  end

end