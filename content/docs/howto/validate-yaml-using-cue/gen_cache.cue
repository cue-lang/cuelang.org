package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "IWtakQWIHs4nDpkC5hevL6DnQu9ZeeRtg3cFP830Whw="
								"initial x.cue":  "DsAkHFqYKC4HnJxkOpdoa6O//3ig1g4/xyE32aiq4BE="
								"another person": "5zCHP4y8D3PU9RFrX5eGkXDm3CCmOtelYdXPSbWZesg="
								"fixed yaml":     "L60EEugsgdfZtALwaFjX8aTuN9ontDpjXUtYq1yQ6FM="
							}
							multi_step: {
								hash:       "19C5NUEEAENLAC6GDUO0FP7OUCU0QU5C6LA3FA1TA6EVJ3VSHQAG===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
