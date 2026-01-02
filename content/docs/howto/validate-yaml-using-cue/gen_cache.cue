package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Zh7AUn1Mq8GByZbtjzE6BfYJl3sKtFDmIVIUhQc7+Y4="
								"initial x.cue":  "XJSOt6aid8LVYvSrGsiHTnA6IYh8x4qe4aQOvenx7WA="
								"another person": "lF9eW4mH3FCcdbIv5ICgpslN8n8mjQD4Itf8/TUwgh4="
								"fixed yaml":     "mrwWAy0tkoABlfRunaJqE9aMycgeBZOQjS//dR2IpGM="
							}
							multi_step: {
								hash:       "GLMPNUTKN54TMCML97K729H22MUP3HTUGQGMEBAQAOOSTF2DU3E0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
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
											    ./x.cue:7:21
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
