# gitartifact #

This is the gitartifact module. It allows you to download release-artifacts from private GitHub repositories (public repositories coming soon).

Simply provide the account, repository name, release tag and some substring of the filename you want downloaded.

For private repositories provide your oauth key.

Tell it where you want the artifact downloaded.

Useful for making package{} (dpkg) closed-source installations without needing to subscribe to expensive private binary hosting services and avoid maintaining your own apt PPA.

# Example #


```puppet
gitartifact { "gitartifact":
        account => "danielburrell",
        repository => "repo",
        releasetag => "0.0.2",
        pattern => ".deb",
        oauth => "YOUR_OAUTH_TOKEN_HERE",
		destination => '/home/dan/gitartifact_0.0.1-SNAPSHOT.deb',
} 
```