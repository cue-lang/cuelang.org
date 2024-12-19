package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ita0a1M0JvvsiDPWi2bfZuI7PHEny2iL4URVLlFVeyo="
								"initial x.cue":  "gWZR8FKyVO5VRm+fJhxnk6s4J1tsS9Y2zwug7kPBQKA="
								"another person": "SNYTG4G6/62Tr7hlXkv6BYKlj2Y5hJIJD/lFHPCvKo8="
								"fixed yaml":     "tJE5AcEtIVSJnKRlsGPB45NAqsbf6n85v8wKesFIZkI="
							}
							multi_step: {
								hash:       "1DMT8VG2NJMTGFBK013SK8Q2SGUTCIIJR8SIORPRER8LUGR2AANG===="
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
