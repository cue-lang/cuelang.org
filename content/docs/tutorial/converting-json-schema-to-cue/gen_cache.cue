package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "TmeEVALCV2VxyUJjbez6d38YGDCOKsySkvLjA71+gNY="
								"schema.cue":         "0ST0Ao2AmjrQaydnMlI3j1ZxfkiQ7DTYXFRcpEqz87s="
								"split_pea.yml":      "oUJqJt5X8/mDUPTHl0zTiGsC32jc3+rFl1LE9xq7pTQ="
								"pomodoro.yml":       "Grl8Yx2ksGBJbEv0eLXSci9h3sQqPR3Msj5nDNNHXWM="
								"pomodoro.yml fixed": "3U8G8a6RGoxH9ORd1ceM/RfB3OuixRSiV+k0x4zX+vA="
							}
							multi_step: {
								hash:       "C3Q30U7REDHFQB2VRENCAQSS6NBG1VS321J6VHELKFMFCHOT8TPG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-alpha.2.0.20261002131943-93402de82790
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
