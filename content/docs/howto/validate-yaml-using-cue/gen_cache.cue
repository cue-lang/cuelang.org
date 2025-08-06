package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Ax47I4XOL8gmSW/ykdNz2XYnoLYXSyCBBaweWN2Hx20="
								"initial x.cue":  "uA4PbMoNbLzxiNBdapF80XHUPlKFj2z+858j76FBjko="
								"another person": "T/YxU3PyIfpMTr0F+7DNrfFyTGoIl7TzkgbagivV+Go="
								"fixed yaml":     "mwn+vWB+WuhJFXuGBRPu+KClZUlyeBIMAW7xYz7oOpM="
							}
							multi_step: {
								hash:       "STU9NPJB9IOA2U1284FCF4KMCI66LKS0F4QLB5QTPNI07Q1VNUT0===="
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
