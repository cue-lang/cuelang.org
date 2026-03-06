package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "zoFcHDQT7nYLRo59hEZiUmg7j7BFcBFOhTR0TCz1uvA="
								"initial x.cue":  "1co2zrfu+WRGGEMI7Pe4jbafa8IV73JkWHVc2ngaGzI="
								"another person": "8/tAvLHljLM6DC+T7+vSx3XhuMRHFGB/HRxLP/EG9w0="
								"fixed yaml":     "FrW6OB7vlPgVcPUO1ejldyY9hNYBIjEc+wnKF4bFwpI="
							}
							multi_step: {
								hash:       "TH79D4UT3RAAN7UKR3SJC6EA0UGV5CQNR3MQ4CP5JNH42QEA01J0===="
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
