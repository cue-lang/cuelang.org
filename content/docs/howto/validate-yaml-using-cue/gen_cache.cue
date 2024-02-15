package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "1Qc+vt5Ra5PqhjmwWjpnM53Y3rWe7xER9DdWqvAqRSI="
								"initial x.cue":  "B7zhcdmgSStDvZmXObNQeoo5eZaKVFwEb4NN3OdLXhU="
								"another person": "fCQoCdiIdLqwHRb5qW+xVtilg+idd94pQdOouB7N5AM="
								"fixed yaml":     "3rgvtSZVtLo/W7ugbGcu2JRixl/MXtXu+kONhQvH36Q="
							}
							multi_step: {
								"OEV34K9NPJ7LU7Q0D5O0D0B9E4MDSS4A5J2T6Q77IJ2OLTQJ7TB0====": [{
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
