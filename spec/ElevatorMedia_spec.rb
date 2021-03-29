require 'elevatormedia'

RSpec.describe ElevatorMedia::Streamer do
    describe "getContent" do
        context "Gets content from streamable API" do
            it "Returns the content as an html string" do
                streamable = ElevatorMedia::Streamer.new
                expect(streamable.getContent()).to be_a_kind_of(String)
            end
        end
    end 
end
