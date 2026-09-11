package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "S6cNNSUwswEMo75gk6JbOUbR2jiUU0Xm1AOCKBRMue0="
								"initial x.cue":  "xYlGOTDd9SgJ3SAV0bTZNHSL4ihoVs88AajQVPoZBpw="
								"another person": "CvL7GY+DXqh0Hu+KM2NASj44anmHhV0AKCh/vjIN3kI="
								"fixed yaml":     "c0d74ooFDSnHCvguESECaLjs9/eYVOmYy5hgw1hPTx8="
							}
							multi_step: {
								hash:       "2LG5HDIPPS7TNSB1IGIM4N532V8HGIQ1KHI02GACLL2UO61FB5K0===="
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
