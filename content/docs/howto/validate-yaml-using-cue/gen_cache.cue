package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "VOHRsudKeQVAoj3+ADLWNmc/q3mTtqRV0yp7FrCzfHY="
								"initial x.cue":  "cw48BQ7bPFbk34WvgbuTNeWZhrZqID2CTnWBr+yok2Q="
								"another person": "efTvQsVPgi127Ei9Tom9X4qT7XmN2VBKeiRBbHX3cCs="
								"fixed yaml":     "h0/AuVxYZWUoBMb/G88/jQvQu8OJS7xb64X57AWEfW8="
							}
							multi_step: {
								hash:       "OANJG6VMQM34HUTLFHDELAK5VMIN6H0I10NQOSDDO47G2TGNU3SG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
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
											    ./x.cue:7:21
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
