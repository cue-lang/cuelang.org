package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "yEfJSvyLAW0DwpqRbaMm7Vz/zKlABYjBgp5JmD1jHXQ="
								"schema.cue":         "ncpYvykPZ6sV89HbsL+zXG3Ip+UZ6wsfSSlggtRNW84="
								"split_pea.yml":      "JENgnJXG/K6eWnatVEKtbs/WZWxzExJ3aG/7KsSVaKs="
								"pomodoro.yml":       "FsBPqPrtLsbizDdpOC3Jn6t4JJ+XuTmmcKLewVAspeo="
								"pomodoro.yml fixed": "3T6tRH3O87jN97uzZQ0tM8gGGay+al8b+q0mQ9UaXpo="
							}
							multi_step: {
								hash:       "HM3L68MFAAA0L7LF5B81FC2E717ACVIQNF4PSAN44LTABQEMDBNG===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:10:16
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
