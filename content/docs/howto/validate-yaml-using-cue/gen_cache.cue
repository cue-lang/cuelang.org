package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "LbUJ+UhCbY3JOhxkwpct5YP/Cx8v619a5KI7wcQlmxw="
								"initial x.cue":  "fopCd3/m0S/9mPC8dqViXmK17Ab2R6AhnbPfnWRGNG4="
								"another person": "C7mAPaWB4YQc/dUvsP6JejMSnuMBoGNAfOt8lqm1E2A="
								"fixed yaml":     "1ZAoX78tuFf70MXyZYdLOOft0J8qfwIWynjh+pnncRk="
							}
							multi_step: {
								hash:       "5M7DOOK6216B74I4LCDPN7UP0GM8G68B8N863FL2GE917CD2960G===="
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
