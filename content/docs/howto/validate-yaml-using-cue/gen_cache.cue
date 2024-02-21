package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "efo5PAWbkXwlsnuaHDO6xffoohR2xq8lERHxAFsgfmk="
								"initial x.cue":  "F+oKrB8zhpCW9xF7h93/ECTJJmYyJNlleONO5iyINl8="
								"another person": "UykWYY7yDxJDQ/DP8mDJq1Get/pX6z6sUS6Xcrsn9b4="
								"fixed yaml":     "VXFd3xCYqNvkqgY4lhjFmBdYCt1W7kk7YfDgLLIWIPQ="
							}
							multi_step: {
								"ARUIM5FVRAC7J0F8L4PEP04I3S3IOSORFHLIHTK878GKIP8TKDKG====": [{
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
