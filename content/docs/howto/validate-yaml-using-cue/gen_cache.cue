package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "9VjdrKNuVvhMbheym5eoRXj9+OVCSnNMo9m5p6ej0io="
								"initial x.cue":  "d3fIBw8FLFHWkS5UsufpRnY0W96KaPBNW8S0Xgi/rc0="
								"another person": "bQ5hvSLWazWAz8m9m+nTaoKAiLSYNfcbh1gJkX6X/uY="
								"fixed yaml":     "E7MTFFsDzeqLfwtvkLSCNQJuS7dxD2RgMFi/8bQLUuQ="
							}
							multi_step: {
								hash:       "8IAJESCM21LUEEAPL5ETK2OCO558AOV2QV0GT99EM95DS4OP2PR0===="
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
