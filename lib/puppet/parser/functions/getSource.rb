require 'json'
require 'net/http'

module Puppet::Parser::Functions
  newfunction(:getSource, :type => :rvalue) do |args|
    account = args[0]
    repository = args[1]
    releasetag = args[2]
    pattern = args[3]
    oauth = args[4]

    uri = URI.parse("https://api.github.com/repos/#{account}/#{repository}/releases?access_token=#{oauth}")
    #args = {include_entities: 0, include_rts: 0, screen_name: 'johndoe', count: 2, trim_user: 1}
    #uri.query = URI.encode_www_form(args)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    data = response.body
    result = JSON.parse(data)
    test = ""
    result.each do |myrelease|
      if (myrelease["tag_name"] == releasetag)
        myrelease["assets"].each do |asset|
          if (asset["name"].include? pattern)
            test = asset["url"]
          end
        end
      end
    end

    notice(test)
    test
  end
end