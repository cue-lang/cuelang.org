package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "IAoEaTDTNCB3LNlHLzOx9J0Yr2Bvk/6aag9+z/99bU4="
								"initial x.cue":  "mEZzXKGl64FhgPgacbb2fs62JQcSXSpeUdsKrK+v1dY="
								"another person": "Z638aeMKz2p6iFLvGoexl6nicD7YXoT7rCy1AfoUbWs="
								"fixed yaml":     "E/83iCMSGxDNpLf5uPtpxrBvmwgdOZJ489qXFCrHUXw="
							}
							multi_step: {
								hash:       "P6A6P9FVH8DA12ISVS1DIK804BNC9EUC8V3FNSMA5JO6GU4TIF40===="
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
