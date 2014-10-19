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
class jq {
  package { "jq":
    name   => 'jq',
    ensure => present,
  }
}

define gitartifact ($account, $repository, $releasetag, $pattern, $oauth, $destination) {
  include ::gitartifact::jq

  wget::fetch { "Download ${title} artifact From GitHub":
    source      => getAssetUrl(getSource($account, $repository, $releasetag, $pattern, $oauth), $oauth),
    destination => $destination,
    timeout     => 0,
    verbose     => false,
    headers     => ['Accept: application/octet-stream'],
    require     => Package['jq']
  }
  Class['jq'] -> Gitartifact["$title"]

}

