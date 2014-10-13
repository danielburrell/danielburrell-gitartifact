module Puppet::Parser::Functions
  newfunction(:getAssetUrl, :type => :rvalue) do |args|
    url = args[0].strip.tr('"', '')
    oauth = args[1]
    test = "#{url}?access_token=#{oauth}"
	notice(test)
    test
  end
end
