require 'pry'

RSpec.describe RubyAfplay do
  it "has a version number" do
    expect(RubyAfplay::VERSION).not_to be nil
  end

  it "opens afplay" do
    player = RubyAfplay::Player.new("spec/data/test.mp3")

    # expect(player).to receive(:spawn).with "afplay data/test.mp3"

    expect { player.play }.to_not raise_error
  end
end
