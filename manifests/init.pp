# Class: gitartifact
#
# This module manages gitartifact
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class gitartifact ($account, $repository, $releasetag, $pattern, $oauth, $destination){
  package { 'jq':
    name   => 'jq',
    ensure => present,
  }
  
  wget::fetch { "Download artifact From GitHub":
	  source      => getAssetUrl(getSource($account, $repository, $releasetag, $pattern, $oauth),$oauth),
	  destination => $destination,
	  timeout     => 0,
	  verbose     => false,
	  headers => ['Accept: application/octet-stream'],
	  require => Package['jq']
	}
	
	
	
  
 
}
