package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "HW7UY9MeFZDBSN+yaICi4BhYZ7iVY9hDhH6ZoDOR56g="
								"x.cue":        "jl7fAKhY25a2GrJGV5epzSk/Cty3vifOHCcmlBthWWk="
								"x.json v2":    "TIzNWmuhbsjo06v3S/Wyto1jNUIBuV06g+C3T/bPUiE="
								"fixed x.json": "cqTVEU8jXUgRPJIQ6R+HkreEJnbPWw17k09btSOdx/w="
							}
							multi_step: {
								hash:       "EPQT3VHA2EUK7SIC2127HIK5B7H9G3BM7DGKJ3GRAH4ORPM8JJE0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
