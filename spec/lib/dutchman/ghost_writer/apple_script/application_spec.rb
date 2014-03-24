require "spec_helper"

describe Dutchman::GhostWriter::AppleScript::Application do

  let(:subject) { described_class.new(container,application) }

  let(:container) { mock("Applescript") }
  let(:application) { "Sublime Text" }

  describe "#keystroke" do

    it "sends a keystroke to an application" do
      subject.keystroke("Hello")
      expect(subject.name).to eq application
      expect(subject.applescript).to eq expected_applescript_command
    end

    let(:expected_applescript_command) do
"""tell application \"#{application}\"
  activate

  tell application \"System Events\"
      keystroke \"Hello\"
    end

end tell"""
    end

  end

  describe "#typed_phrase" do

    let(:typing_speed) { double("Speed",delay_between_characters: 0.1)}

    it "sends keystrokes over time to an application" do
      subject.typed_phrase("Hello",typing_speed)
      expect(subject.applescript).to eq  expected_applescript_command
    end

    let(:expected_applescript_command) do
%{tell application "#{application}"
  activate

  tell application "System Events"
      keystroke "H"
      delay 0.1
      keystroke "e"
      delay 0.1
      keystroke "l"
      delay 0.1
      keystroke "l"
      delay 0.1
      keystroke "o"
      delay 0.1
    end

end tell}
    end

  end

end