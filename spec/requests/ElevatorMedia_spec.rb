require 'elevatormedia'

RSpec.describe ElevatorMedia::Streamer do
    describe "getContent" do
        context "Gets content from streamable API" do
            it "It returns the content as an html string" do
                streamable = ElevatorMedia::Streamer.new
                expect(streamable.getContent()).to be_a_kind_of(String)
            end
        end
    end 

    describe "getCatFacts" do
        context "Gets a random activity from an API" do
            it "It returns the activity" do
                activity = ElevatorMedia::Streamer.new
                expect(activity.getActivity()).to be_a_kind_of(String)
            end
        end
    end
    
    describe "getBTC" do
        context "Gets the price of Bitcoin" do
            it "It returns the price as an integer" do
                activity = ElevatorMedia::Streamer.new
                expect(activity.getBTC()).to be_a_kind_of(Integer)
            end
        end
    end

    describe "getJoke" do
        context "Gets a joke from an API" do
            it "It returns the joke as a string" do
                joke = ElevatorMedia::Streamer.new
                expect(joke.getJoke()).to be_a_kind_of(String)
            end
        end
    end
end
