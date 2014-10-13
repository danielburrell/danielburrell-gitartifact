module Puppet::Parser::Functions
  newfunction(:getSource, :type => :rvalue) do |args|
    account = args[0]
    repository = args[1]
    releasetag = args[2]
    pattern = args[3]
    oauth = args[4]
    test = `curl -sS https://api.github.com/repos/#{account}/#{repository}/releases?access_token=#{oauth} | jq 'map(select(.tag_name == "#{releasetag}")) | .[0].assets | map(select(.name | contains("#{pattern}"))) | .[0].url'`
	notice(test)
    test
  end
end
