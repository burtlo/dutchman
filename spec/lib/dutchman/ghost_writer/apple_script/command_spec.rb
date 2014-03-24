require "spec_helper"

describe Dutchman::GhostWriter::AppleScript::Command do

  let(:subject) { described_class.new(container,given_applescript) }

  let(:container) { mock("Applescript") }

  it "allows you to execute a command" do
    expect(subject.to_s).to eq expected_command
  end

  let(:given_applescript) do
"""tell application \"Safari\"
  activate

  tell application \"System Events\"
    keystroke \"Hello\"
  end
end tell"""
  end

  let(:expected_command) do
"""osascript <<END
#{given_applescript}
END"""
  end

end