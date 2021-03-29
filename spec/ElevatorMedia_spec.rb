require 'elevatormedia'

RSpec.describe ElevatorMedia, "#getContent" do
    streamable = ElevatorMedia::Streamer.new
    streamable.getContent()
    puts streamable.video
end