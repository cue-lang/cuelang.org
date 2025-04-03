package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "23LufCNLbrSKFWR7Vk0NwbDih4YsHfcfnr/TLLADqjs="
								"initial x.cue":  "AA+2qgS2A3gEBmPR8OtxLmQBnKB96pUGZpA3NH17Pd8="
								"another person": "lwqzXVtW+avqYPMzstRZGHtcuZ/7hPngLrmaYPdojMQ="
								"fixed yaml":     "7kqDOi6d756fG28U5hfSy39mWAqlAu0NyFsQ1mJo08U="
							}
							multi_step: {
								hash:       "59M0TDRMM9J43M9QF2N6D2AD260I1ENURMP2CT1LHFSI0MBVSRHG===="
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
