package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "kGW365pLM0KJ4Y07lpLiEb709ESt+VAGyO2M6xutp5Q="
							}
							upload: {
								"baseline input":   "3JLKIuojOUX7vtfZd4eM94PuQFhJXU2k5a7ttN8RJ8k="
								"baseline output":  "JJUyAvXDd0Izr6SLrK5OlTc4do8B2eKF/NNfSfVYbCY="
								schema:             "lJKGIWMZH8UmmfHhXQktiD8sUDtKpQfxfjQs5VxyOWA="
								"schema reupload":  "Z1Z8Ldh6u4+WfjK/o/CTj171T6djAxNZnwdTTfcq8h4="
								"schema output":    "7K96R1eqPJusNc/BaAYZxdsgNL3Nt/7ToKyNcd1355M="
								defaults:           "tUamUTfn1SdYnuJeff8jmpET4kPvAYyEV/4uQGoyv9M="
								"defaults output":  "gWZ9g/leKTLmaRCgsmpfD8B8arK1oBgxBbNb2m+aAEw="
								name:               "YzSOYgFH+mThJbmhzvsjhpONZXte2QZITyDy46pVYaU="
								"name output":      "UNI0YK2GMLaLgU0RxCvnMGYP0clkj7/UeBR921kQC9Q="
								"extra app":        "ITc0ubYC0inl2v0N9AgaNGatcEW8sMH5G1eo77oLdYk="
								"extra app output": "eHmJTMfG91hUnLrK8XRPSInpp8b1HS7BlCXFVwzjPUk="
								"pre-trim source":  "mBk/UbUDE/NjU94CEEZ0igML5sgdiQNYk9El19OvRmE="
								"post-trim alpha":  "HLuuPKgdpslYyn+Ea1a/ZBCHAjUnsC5NV2ULghwnw2Y="
								"post-trim beta":   "IQ5+DLYam25RfPgGXye9azRRHGEIKGYPBRK2ZA1WSI4="
								"post-trim gamma":  "gG/+jSHUj8bqslBuSm6EuW7egtMOjnApq5B7Wb9wL3U="
								"post-trim output": "UGgKoGnFe2BQQ2EwAisKi18WTcXwl+gJq1r/VGF7uJ0="
							}
							multi_step: {
								hash:       "2BV67V2G5RPF23LHS4MLLP2L6MN1KD1M0UMML5MKJSQFO1J1R0I0===="
								scriptHash: "JIPADP79TIMUIMVVO8STGAUSB5BK8PD9HO8VR1AGQAL09MO36AU0===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
