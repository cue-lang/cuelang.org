package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ma5v2uTKTtN8Ovm69VKiskqi2jr5ueDPawNBiIxOWFw="
								"initial x.cue":  "K9xD5IfzGtnADwReeT32Aujbg2tHUfl9QOChWNz4f70="
								"another person": "nRGX3wdDDM7qYsTVklQ++aiNjEYZR+9B+Q8Bt9fBvLQ="
								"fixed yaml":     "yfr6EUFPp5uIEewpYDjXHrV5HnccoJEMf/8StBYxALY="
							}
							multi_step: {
								hash:       "FS3R962C64J6BSEP60O55VHS4QDOU6EUL43VM64UFDMLU0QOQUCG===="
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
