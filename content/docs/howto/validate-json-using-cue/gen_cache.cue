package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "wpCd9gUU6C8IN3Sii/EsTaVhc7ccIsKZN8jQoLjPnkY="
								"x.cue":        "sfz4RTA3SoAHEYT5ZmCmSWa33a3zUHIQWrt1+B9Mi7k="
								"x.json v2":    "T06TusmMpPNIFCAGZMCFis22eQybG5U0/SS5OOiF4/k="
								"fixed x.json": "EO2Ca98jmB+jpFLhPCuZde9sWe3tlYaDD1xvMz07tRg="
							}
							multi_step: {
								hash:       "FF51D1AN6E0TJPCD8KJORS5A43GL9FIVKIHSKR4IFQKNAHCIN810===="
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
