require "spec_helper"

describe Dutchman::GhostWriter::AppleScript do

  it "allows you to create an application command" do
    app = subject.app("Safari")
    expect(app.name).to eq("Safari")
  end

end