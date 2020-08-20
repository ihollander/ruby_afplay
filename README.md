# Ruby Afplay

A gem to play audio from the command line using `afplay`. OS X only!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_afplay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_afplay

## Usage

Create a new player instance by passing in a path to an mp3 file:

```rb
player = RubyAfplay::Player.new("demo/test.mp3")
```

The `player` instance has three methods for interacting with the mp3 player:

```rb
player.play  # start/resume playing (and start afplay process)
player.pause # pause playing
player.stop  # stop playing (and kill afplay process)
```

Here's a simple example of playing/pausing/stopping file from the command line:

```rb
player = RubyAfplay::Player.new("demo/test.mp3", volume: 2, time: 10, rate: 0.5)

input = nil
while input != "exit"
  puts `clear`
  puts <<~MENU
  Enter a command to control the audio player. Options: 

  play  |  start playing audio or resume paused audio
  pause |  pause playing audio
  stop  |  stop playing
  exit  |  exit player

  MENU
  print "Your Command: "
  input = gets.chomp

  case input
  when "play"
    player.play
  when "pause"
    player.pause
  when "stop"
    player.stop
  when "exit"
    player.stop
  end
end

puts "TTFN!"
```
