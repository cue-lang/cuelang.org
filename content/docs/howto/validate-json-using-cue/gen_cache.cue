package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8gf/BVbBx0Wr5E8gIXrw6AfWJbwsCEKy1MmNdTnx79c="
								"x.cue":        "KrO0KcnIo37SOqYhCVydqrdrVhmtB8G5mELB8OTwz8I="
								"x.json v2":    "P4Qnqm+P47lifOjmwX2f3z74RPP819mH6kGAfFMqleY="
								"fixed x.json": "HlJRJbK2G7DE88dHj08v4h8SZs7XBo74cLgOVbzJTZw="
							}
							multi_step: {
								hash:       "A983TRQRHLPBJ4HAM60TE5BBTOCBJ2UE4JMRVV2QFQ63AD98THFG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
