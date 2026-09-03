package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "atiuyLPa18Rmtw4Gpo1Y74+9S1TmiGVEmIKWRyGVae8="
								"initial x.cue":  "CjicegNZnWiz/BXNncpnPHm45XEzzcfITbg0AONnZfM="
								"another person": "CemRzmdgGsWbXiDCDGSwnjub3PubChJIcPR1UTw7+Hk="
								"fixed yaml":     "xqYf+5JTQFmY5Zyam7XYI4/HPxpPGdXWsrkuMgu856Y="
							}
							multi_step: {
								hash:       "IHU45SGEUVLP5557OEB4F9TBRS34SRHQ6ADP6SSKUGJ0TG61UMA0===="
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
