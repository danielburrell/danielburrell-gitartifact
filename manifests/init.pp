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
define gitartifact ($account, $repository, $releasetag, $pattern, $oauth, $destination) {

  
  wget::fetch { "Download-${title}-artifact-From-GitHub":
    source      => getAssetUrl(getSource($account, $repository, $releasetag, $pattern, $oauth), $oauth),
    destination => $destination,
    timeout     => 0,
    verbose     => false,
    headers     => ['Accept: application/octet-stream']
  }
}