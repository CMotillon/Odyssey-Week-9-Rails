require 'json'
require 'net/http'

module ElevatorMedia
    class Streamer
        attr_reader :content
        attr_reader :video
        attr_reader :activity
        attr_reader :BTC
        attr_reader :joke

        def getContent
            @content = Net::HTTP.get(URI('https://api.streamable.com/oembed.json?url=https://streamable.com/hn8hq'))
            json_parse = JSON.parse(@content)['html'].to_s
            @video = "<div class='container video'> #{json_parse.to_s} </div>"

            p @video
            return @video
        end

        def  getActivity
            @content = Net::HTTP.get(URI('https://www.boredapi.com/api/activity'))
            json_parse = JSON.parse(@content)
            @activity = json_parse["activity"].to_s

            p @activity
            return @activity
        end

        def getBTC
            @content = Net::HTTP.get(URI('https://api.coindesk.com/v1/bpi/currentprice.json'))
            json_parse = JSON.parse(@content)
            @BTC = json_parse["bpi"]["USD"]["rate_float"].to_i

            p @BTC
            return @BTC
        end

        def getJoke
            @content = Net::HTTP.get(URI('https://official-joke-api.appspot.com/random_joke'))
            json_parse = JSON.parse(@content)
            @joke = json_parse["setup"].to_s + " " + json_parse["punchline"].to_s

            p @joke
            return @joke
        end
    end
end