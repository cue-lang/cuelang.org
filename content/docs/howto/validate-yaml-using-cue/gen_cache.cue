package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JVpAcZFnh42lwqH8d6RfyTwwM8jP1V+tQ6YbqAPeEAA="
								"initial x.cue":  "/hvk5pjTHOcHMF1Zd795syN3CRBJy6lIfd2g5SOqyB4="
								"another person": "OVSnpo1NL0HFjNImP3vTh3KDGZ2hVzISpXMn02omJZI="
								"fixed yaml":     "fwQ0Tc2eNYag+vq4Xrmt5w4ziGz8RMdsSvGy/uKZXdc="
							}
							multi_step: {
								hash:       "PGG1OJ2OJ6U84023OGGH1EE7633O60VJIQ77SUQH91F5MJ1VBKVG===="
								scriptHash: "FCVR3RQM9KMC4K4253KBPI107J84GMJJJ8ULKG41E4AVUBFH6UUG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:25
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
