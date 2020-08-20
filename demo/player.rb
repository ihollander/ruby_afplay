require_relative "../lib/ruby_afplay"

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