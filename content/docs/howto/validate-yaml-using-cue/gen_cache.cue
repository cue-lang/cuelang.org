package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "V54TNitbAt4vU1RAvGQjnFCCW8HM17+SMUsncQ0gEAg="
								"initial x.cue":  "t9j/3h1mVP50P92DGCjgXJtcwRZvbkckGXgWDTo11OI="
								"another person": "LBqF/ZYrP0J0AEsO8yegZVCKZPFA1gxi99O2InRZFKs="
								"fixed yaml":     "qvaZJ0thKcbirmWS2coSOBgRGpGQw25vbe48w6LfaNU="
							}
							multi_step: {
								hash:       "TVLSOA3ETTV663H1OVVB35T90U3S28N0CR3U4I49H4LPPUOH670G===="
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
