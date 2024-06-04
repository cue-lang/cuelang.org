package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "WLpNilTWP8SFsDBs3utihF4+EZktShA+m4ToMTwOQqY="
								"initial x.cue":  "daHaL/hkSjwrw2G2pFfjHVxeNHbrMth/mfkIb4vU5hA="
								"another person": "vbDxNuOQkgvma2yXYnZs9UZOio3w3kaqeV2FMk640W0="
								"fixed yaml":     "qN5WaDGTPJHeI8F81Z34z6EEz2OzhVP2VhZSCzJbPwo="
							}
							multi_step: {
								hash:       "JDJGUNKH5G3KEQBILQ6NQ4ESC8PTOPCP8E8CVL0QIMQ855HLCF20===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
