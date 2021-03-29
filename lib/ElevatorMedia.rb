require 'json'
require 'net/http'

module ElevatorMedia
    class Streamer
        attr_reader :content
        attr_reader :video

        def getContent
            @content = Net::HTTP.get(URI('https://api.streamable.com/oembed.json?url=https://streamable.com/hn8hq'))
            json_parse = JSON.parse(@content)['html'].to_s
            @video = "<div class='container-fluid video'> #{json_parse.to_s} </div>"
        end
    end
end