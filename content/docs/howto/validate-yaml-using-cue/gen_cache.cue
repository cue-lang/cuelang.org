package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "KQrNsLu4bmh5XJ/wirFX7ZSvNdUb0vuVhICWy87iAQQ="
								"initial x.cue":  "cb5uuRPFwwzyll+llklsGo94xW6gds125XRicl2TL4M="
								"another person": "Oa1zgsZpA0JhbOHgdAlNudl2013jtJllQ3JA/qlyQu0="
								"fixed yaml":     "EMZ231IrQcwew4v+J1c3il9qlKKbI+DC9lDqFMIrVPA="
							}
							multi_step: {
								hash:       "I2SKNU60R6D341QGNTVDEC6KIGET5RA7O0LO8F0NB44I6SMSQ44G===="
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
