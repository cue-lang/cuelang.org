package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ZxPaalR5rNMF8xnSVCsUbY9BIZF/AzJFcl5pC4+v4SI="
								"initial x.cue":  "n0qNLEeTuHuVDqSALHQs4Ka3opWGueGAwAYaJLLTNCY="
								"another person": "ZfO3K3iT3mEE8TG29YiGnhzOymxzWTZy5X3FWnG1oYE="
								"fixed yaml":     "RUmHHx0trhqYGqkn4/REYQfDOLoFs0bbvoOMoIXk68A="
							}
							multi_step: {
								hash:       "QSQ37NMB4M6KMJ1NPOKL59BV3OCFI3HMFDGVVJBF4BQ62E3NFL4G===="
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
